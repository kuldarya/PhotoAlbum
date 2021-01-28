//
//  AlbumsListViewController.swift
//  PhotoAlbum
//
//  Created by Darya Kuliashova on 27.01.21.
//

import UIKit
import Alamofire

final class AlbumsListViewController: UIViewController {
    @IBOutlet private weak var albumsTableView: UITableView!
    
    private let albumAPIClient = AlbumAPIClient()
    
    var albums = [Album]() {
        didSet {
            albums.sort { $0.title < $1.title }
            albumsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumsTableView.dataSource = self
        albumsTableView.delegate = self
        
        navigationItem.title = TextConstants.navigationAlbumTitle
        
        
        getAllAlbums()
    }
    
     private func getAllAlbums() {
        albumAPIClient.fetchAllAlbums { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let albums):
                self.albums = albums
            case .failure(let error):
                assertionFailure(error.localizedDescription)
            }
        }
    }
}

extension AlbumsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.className, for: indexPath) as? AlbumCell else {
            assertionFailure("AlbumCell was not initialized properly")
            return UITableViewCell()
        }
        cell.album = albums[indexPath.item]
        return cell
    }
}

extension AlbumsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let albumPhotosViewController = UIStoryboard.mainStoryboard?.instantiateViewController(PhotosViewController.self) else {
            assertionFailure("PhotosViewController could not be instantiated")
            return
        }
        albumPhotosViewController.album = albums[indexPath.item]
        navigationController?.pushViewController(albumPhotosViewController, animated: true)
    }
}

