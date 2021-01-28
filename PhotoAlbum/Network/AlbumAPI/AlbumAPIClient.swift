//
//  AlbumAPIClient.swift
//  PhotoAlbum
//
//  Created by Darya Kuliashova on 28.01.21.
//

import Foundation
import Alamofire

final class AlbumAPIClient {
    func fetchAllAlbums(completion: @escaping (Result<[Album], Error>) -> Void) {
        APIClient.fetch(route: AlbumAPIRouter.getAll) { (result: Result<[String: [Album]], Error>) in
            switch result {
            case .success(let dict):
                let albums = dict["albums"] ?? []
                completion(.success(albums))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
