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
        let indicatorOptions = SegmentioIndicatorOptions(type: .bottom, ratio: 0.32, height: 2, color: .red)
        let horizontalSeparatorOptions = SegmentioHorizontalSeparatorOptions(type: .none, height: 0, color: .white)
        let verticalSeparatorOptions = SegmentioVerticalSeparatorOptions(ratio: 1, color: .gray)
        
        let segmentStates = SegmentioStates(defaultState: SegmentioState(backgroundColor: .clear,
                                                                         titleFont: .font(.nunitoBold, size: .medium),
                                                                         titleTextColor: .black),
                                            selectedState: SegmentioState(backgroundColor: .clear,
                                                                          titleFont: .font(.nunitoBold, size: .medium),
                                                                          titleTextColor: .red),
                                            highlightedState: SegmentioState(backgroundColor: .clear,
                                                                             titleFont: .font(.nunitoBold, size: .medium),
                                                                             titleTextColor: .red))
        
        let options = SegmentioOptions(backgroundColor: .white,
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
