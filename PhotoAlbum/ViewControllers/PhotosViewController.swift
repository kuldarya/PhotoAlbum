//
//  PhotosViewController.swift
//  PhotoAlbum
//
//  Created by Darya Kuliashova on 28.01.21.
//

import UIKit

class PhotosViewController: UIViewController {
    @IBOutlet private weak var photosCollectionView: UICollectionView!
    
    private let photoAPIClient = PhotoAPIClient()
    
    var album: Album?
    var photos = [Photo]() {
        didSet {
            photosCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
        
        navigationItem.title = TextConstants.navigationPhotosTitle
        
        getAllPhotos()
    }
    
    private func getAllPhotos() {
        photoAPIClient.fetchAllPhotos { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case .success(let photos):
                    guard let album = self.album else { return }
                    let filteredPhotos = photos.filter { $0.albumId == album.id }

                    self.photos = filteredPhotos
                case .failure(let error):
                    assertionFailure(error.localizedDescription)
            }
        }
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.className, for: indexPath) as? PhotoCell else {
            assertionFailure("PhotoCell was not initialized properly")
            return UICollectionViewCell()
        }
        cell.photo = photos[indexPath.item]
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let photoDetailsViewController = UIStoryboard.mainStoryboard?.instantiateViewController(PhotoDetailsViewController.self) else {
            assertionFailure("PhotoDetailsViewController could not be instantiated")
            return
        }
        photoDetailsViewController.photo = photos[indexPath.item]
        navigationController?.pushViewController(photoDetailsViewController, animated: true)
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 10
        let collectionCellSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionCellSize, height: collectionCellSize)
    }
}



