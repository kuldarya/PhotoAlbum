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
            print("in didSet: \(albums.count)")
            
            albumsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumsTableView.delegate = self
        albumsTableView.delegate = self
        
        navigationItem.title = TextConstants.navigationAlbumTitle
        
        getAllAlbums()
        print("in viewDidLoad: \(albums.count)")
        
        print("var albums: \(albums.count)")
    }
    
     private func getAllAlbums() {
        albumAPIClient.fetchAllAlbums { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let albums):
                self.albums = albums
                print("in completion: \(self.albums.count)")
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as? AlbumCell else {
            assertionFailure("AlbumCell was not initialized properly")
            return UITableViewCell()
        }
        cell.album = albums[indexPath.item]
        print("In DATA SOURCE: \(albums[indexPath.item])")
        return cell
    }
}

extension AlbumsListViewController: UITableViewDelegate {
    
}

