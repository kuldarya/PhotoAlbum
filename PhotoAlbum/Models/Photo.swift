//
//  Photo.swift
//  PhotoAlbum
//
//  Created by Darya Kuliashova on 28.01.21.
//

import Foundation

struct Photo: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
