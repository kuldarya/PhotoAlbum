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
    
}



