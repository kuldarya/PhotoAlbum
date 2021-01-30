//
//  PhotoCell.swift
//  PhotoAlbum
//
//  Created by Darya Kuliashova on 28.01.21.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet private weak var photoTitleLabel: UILabel!
    @IBOutlet private weak var photoImageView: UIImageView!
        
    var photo: Photo? {
        didSet {
            if let photo = photo {
                photoTitleLabel.text = photo.title
                getPhotos()
            }
        }
    }

    private func getPhotos() {
        if let photo = photo,
           let url = URL(string: photo.thumbnailUrl) {
            photoImageView.load(url: url)
        }
    }
}
