//
//  AlbumCell.swift
//  PhotoAlbum
//
//  Created by Darya Kuliashova on 28.01.21.
//

import UIKit

final class AlbumCell: UITableViewCell {
    @IBOutlet private weak var albumTitleLabel: UILabel!
    
    var album: Album? {
        didSet {
            albumTitleLabel.text = album?.title
        }
    }
}
