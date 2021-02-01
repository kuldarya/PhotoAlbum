//
//  PhotoDetailsViewController.swift
//  PhotoAlbum
//
//  Created by Darya Kuliashova on 30.01.21.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
    @IBOutlet private weak var photoImageView: UIImageView!
    
    private let downloadManager = DownloadManager.shared
    var photo: Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = TextConstants.navigationPhotoDetailsTitle
        navigationItem.backButtonTitle = TextConstants.cancel
        
        setPhoto()
    }
    
    @IBAction private func dismissModalView(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    private func setPhoto() {
        guard let photo = photo, let url = URL(string: photo.url) else {
            assertionFailure("Photo is nil or url is not found")
            return
        }
        downloadManager.getProductImage(with: url) { [weak self] image in
            guard let self = self else { return }
            self.photoImageView.image = image
        }
    }
}
