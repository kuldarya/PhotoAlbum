//
//  PhotoAPIClient.swift
//  PhotoAlbum
//
//  Created by Darya Kuliashova on 28.01.21.
//

import Foundation
import Alamofire

final class PhotoAPIClient {
    func fetchAllPhotos(completion: @escaping (Result<[Photo]>) -> Void) {
        APIClient.fetch(route: APIRouter.getAllPhotos) { (result: Result<[Photo]>) in
            switch result {
            case .success(let photos):
                completion(.success(photos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
