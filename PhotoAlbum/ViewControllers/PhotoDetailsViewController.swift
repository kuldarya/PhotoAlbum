//
//  PhotoDetailsViewController.swift
//  PhotoAlbum
//
//  Created by Darya Kuliashova on 30.01.21.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    
    var photo: Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = TextConstants.navigationPhotoDetailsTitle
        navigationItem.backButtonTitle = TextConstants.cancel
    }
    
    @IBAction private func dismissModalView(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
