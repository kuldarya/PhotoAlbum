//
//  PhotoCell.swift
//  PhotoAlbum
//
//  Created by Darya Kuliashova on 28.01.21.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var photoTitleLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            photoTitleLabel.text = photo?.title
        }
    }
}
