//
//  SKPhotoBrowserKingfisherCache.swift
//  SampleProject
//
//  Created by Alperen Ünal on 23.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import SKPhotoBrowser
import Kingfisher

class SKPhotoBrowserKingfisherCache: SKImageCacheable {

    let cache = ImageCache.default

    func imageForKey(_ key: String) -> UIImage? {
        cache.retrieveImageInMemoryCache(forKey: key)
    }

    func setImage(_ image: UIImage, forKey key: String) {
        cache.store(image, forKey: key)
    }

    func removeImageForKey(_ key: String) {
        cache.removeImage(forKey: key)
    }

    func removeAllImages() {}

}
