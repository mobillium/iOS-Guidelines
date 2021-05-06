//
//  SKPhotoBrowserRoute.swift
//  SampleProject
//
//  Created by Alperen Ünal on 6.05.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import SKPhotoBrowser

protocol SKPhotoBrowserRoute {
    func presentSKPhotoBrowser(with photos: [String], viewController: UIViewController, initialPageIndex: Int)
}

extension SKPhotoBrowserRoute where Self: RouterProtocol {
    
    func presentSKPhotoBrowser(with photos: [String], viewController: UIViewController, initialPageIndex: Int) {
        let skPhotos = photos.map { SKPhoto.photoWithImageURL($0) }
        let photoBrowser = SKPhotoBrowser(photos: skPhotos, initialPageIndex: initialPageIndex)
        viewController.present(photoBrowser, animated: true)
    }
    
}
