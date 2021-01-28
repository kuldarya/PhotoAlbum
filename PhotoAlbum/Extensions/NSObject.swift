//
//  NSObject.swift
//  PhotoAlbum
//
//  Created by Darya Kuliashova on 28.01.21.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
