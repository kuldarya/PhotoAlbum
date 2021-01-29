//
//  APIRouter.swift
//  PhotoAlbum
//
//  Created by Darya Kuliashova on 28.01.21.
//

import Foundation

enum APIRouter: Router {
    case getAllAlbums
    case getAllPhotos
    
    var path: String {
        switch self {
        case .getAllAlbums:
            return "/albums"
        case .getAllPhotos:
            return "/photos"
        }
    }
    
    func asURL() -> URL {
        if let url = URL(string: TextConstants.basePath)?.appendingPathComponent(path) {
            return url
        } else {
            fatalError("URL can't be nil.")
        }
    }
}
