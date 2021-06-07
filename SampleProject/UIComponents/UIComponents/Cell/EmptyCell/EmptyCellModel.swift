//
//  EmptyCellModel.swift
//  UIComponents
//
//  Created by Murat Celebi on 4.06.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

public protocol EmptyCellDataSource: AnyObject {
    
}

public protocol EmptyCellEventSource: AnyObject {
    
}

public protocol EmptyCellProtocol: EmptyCellDataSource, EmptyCellEventSource {
    
}

public final class EmptyCellModel: EmptyCellProtocol {
    
}
