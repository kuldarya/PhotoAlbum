//
//  DownloadManager.swift
//  PhotoAlbum
//
//  Created by Darya Kuliashova on 1.02.21.
//

import UIKit

final class DownloadManager {
    static let shared = DownloadManager()
    
    func getProductImage(with url: URL, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    completion(image)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}
