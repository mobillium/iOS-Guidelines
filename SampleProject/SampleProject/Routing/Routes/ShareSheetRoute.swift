//
//  ShareSheetRoute.swift
//  SampleProject
//
//  Created by Murat Celebi on 04.06.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

protocol ShareSheetRoute {
    func presentShareSheet(items: [Any])
}

extension ShareSheetRoute where Self: RouterProtocol {
    
    func presentShareSheet(items: [Any]) {
        let shareSheetController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        let transition = ModalTransition()
        
        open(shareSheetController, transition: transition)
    }
}
