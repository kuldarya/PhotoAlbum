//
//  AlbumAPIRouter.swift
//  PhotoAlbum
//
//  Created by Darya Kuliashova on 28.01.21.
//

import Foundation

enum AlbumAPIRouter: Router {
    case getAll
    
    var path: String {
        switch self {
        case .getAll:
            return "/albums"
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
