//
//  Album.swift
//  PhotoAlbum
//
//  Created by Darya Kuliashova on 28.01.21.
//

import Foundation

final class Album: Codable {
    let userId: Int
    let id: Int
    let title: String
    
    init(userId: Int, id: Int, title: String) {
        self.userId = userId
        self.id = id
        self.title = title
    }
}
