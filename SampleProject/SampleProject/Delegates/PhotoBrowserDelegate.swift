//
//  SKPhotoBrowserDelegate.swift
//  SampleProject
//
//  Created by Alperen Ünal on 7.05.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import SKPhotoBrowser

final class PhotoBrowserDelegate: SKPhotoBrowserDelegate {

    var didScrollToRow: IntClosure?
    
    func didScrollToIndex(_ browser: SKPhotoBrowser, index: Int) {
        didScrollToRow?(index)
    }
    
}
