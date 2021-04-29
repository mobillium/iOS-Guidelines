//
//  AppDelegate+SKPhotoBrowser.swift
//  SampleProject
//
//  Created by Alperen Ünal on 23.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import SKPhotoBrowser

extension AppDelegate {

    func configureSKPhotoBrowser() {
          SKPhotoBrowserOptions.displayAction = false
          SKPhotoBrowserOptions.displayHorizontalScrollIndicator = false
          SKPhotoBrowserOptions.displayVerticalScrollIndicator = false
          SKPhotoBrowserOptions.displayCounterLabel = true
          SKCache.sharedCache.imageCache = SKPhotoBrowserKingfisherCache()
      }

}
