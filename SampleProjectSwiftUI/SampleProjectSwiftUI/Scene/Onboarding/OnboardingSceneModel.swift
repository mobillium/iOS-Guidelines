//
//  OnboardingSceneModel.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 22.09.2022.
//

import Components
import SwiftUI

class OnboardingSceneModel: BaseSceneModel {
    
    var numberOfPages: Int {
        return items.count
    }
    
    @Published var items: [OnboardingViewModel] = [OnboardingViewModel(imageName: "img_walkthrough_1",
                                                                       title: L10n.WalkThrough.firstTitle,
                                                                       description: L10n.WalkThrough.descriptionText),
                                                   OnboardingViewModel(imageName: "img_walkthrough_2",
                                                                       title: L10n.WalkThrough.secondTitle,
                                                                       description: L10n.WalkThrough.descriptionText),
                                                   OnboardingViewModel(imageName: "img_walkthrough_3",
                                                                       title: L10n.WalkThrough.thirdTitle,
                                                                       description: L10n.WalkThrough.descriptionText),
                                                   OnboardingViewModel(imageName: "img_walkthrough_4",
                                                                       title: L10n.WalkThrough.fourthTitle,
                                                                       description: L10n.WalkThrough.descriptionText)]
}
