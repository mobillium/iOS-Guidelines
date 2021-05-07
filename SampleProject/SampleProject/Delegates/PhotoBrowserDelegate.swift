//
//  SKPhotoBrowserDelegate.swift
//  SampleProject
//
//  Created by Alperen Ünal on 7.05.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import SKPhotoBrowser

final class PhotoBrowserDelegate: SKPhotoBrowserDelegate {

    var willDismissAtPage: IntClosure?

    func willDismissAtPageIndex(_ index: Int) {
        if let didDismiss = willDismissAtPage {
            didDismiss(index)
        }
    }
    
}
