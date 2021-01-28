//
//  AlbumsListViewController.swift
//  PhotoAlbum
//
//  Created by Darya Kuliashova on 27.01.21.
//

import UIKit

final class AlbumsListViewController: UIViewController {
    @IBOutlet private weak var albumsTableView: UITableView!
    
    private var albums = [Album]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = TextConstants.navigationAlbumTitle
        
        albumsTableView.delegate = self
        albumsTableView.reloadData()
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
        cell.album = albums[indexPath.row]
        return cell
    }
}

extension AlbumsListViewController: UITableViewDelegate {
    
}

