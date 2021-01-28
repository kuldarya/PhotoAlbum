//
//  AlbumAPIClient.swift
//  PhotoAlbum
//
//  Created by Darya Kuliashova on 28.01.21.
//

import Foundation
import Alamofire

final class AlbumAPIClient {
    func fetchAllAlbums(completion: @escaping (Result<[Album]>) -> Void) {
        APIClient.fetch(route: APIRouter.getAllAlbums) { (result: Result<[Album]>) in
            switch result {
            case .success(let albums):
                completion(.success(albums))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
