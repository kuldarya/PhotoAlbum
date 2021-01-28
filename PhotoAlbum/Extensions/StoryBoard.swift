//
//  StoryBoard.swift
//  PhotoAlbum
//
//  Created by Darya Kuliashova on 28.01.21.
//

import UIKit

extension UIStoryboard {
    public static var mainStoryboard: UIStoryboard? {
        let bundle = Bundle.main
        guard let name = bundle.object(forInfoDictionaryKey: "UIMainStoryboardFile") as? String else {
            return nil
        }
        return UIStoryboard(name: name, bundle: bundle)
    }
    
    public func instantiateViewController<T>(_ identifier: T.Type) -> T? {
        let storyboardID = String(describing: identifier)
        if let viewController = instantiateViewController(withIdentifier: storyboardID) as? T {
            return viewController
        } else {
            return nil
        }
    }
}
