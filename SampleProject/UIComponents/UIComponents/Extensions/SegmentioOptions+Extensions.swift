//
//  SegmentioOptions+Extensions.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 23.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Segmentio

public extension SegmentioOptions {
    
    static func options() -> SegmentioOptions {
        let indicatorOptions = SegmentioIndicatorOptions(type: .bottom, ratio: 0.32, height: 2, color: .appRed)
        let horizontalSeparatorOptions = SegmentioHorizontalSeparatorOptions(type: .none, height: 0, color: .appWhite)
        let verticalSeparatorOptions = SegmentioVerticalSeparatorOptions(ratio: 1, color: .appZircon)
        
        let segmentStates = SegmentioStates(defaultState: SegmentioState(backgroundColor: .clear,
                                                                         titleFont: .font(.nunitoBold, size: .medium),
                                                                         titleTextColor: .appCinder),
                                            selectedState: SegmentioState(backgroundColor: .clear,
                                                                          titleFont: .font(.nunitoBold, size: .medium),
                                                                          titleTextColor: .appRed),
                                            highlightedState: SegmentioState(backgroundColor: .clear,
                                                                             titleFont: .font(.nunitoBold, size: .medium),
                                                                             titleTextColor: .appRed))
        
        let options = SegmentioOptions(backgroundColor: .appWhite,
                                       segmentPosition: .fixed(maxVisibleItems: 2),
                                       scrollEnabled: false, indicatorOptions: indicatorOptions,
                                       horizontalSeparatorOptions: horizontalSeparatorOptions,
                                       verticalSeparatorOptions: verticalSeparatorOptions,
                                       imageContentMode: .center,
                                       labelTextAlignment: .center,
                                       segmentStates: segmentStates)
        return options
    }
    
}
