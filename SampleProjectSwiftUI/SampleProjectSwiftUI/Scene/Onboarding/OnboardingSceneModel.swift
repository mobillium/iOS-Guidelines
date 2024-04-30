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
                                                                       title: L10n.Modules.WalkThrough.firstTitle,
                                                                       description: L10n.Modules.WalkThrough.descriptionText),
                                                   OnboardingViewModel(imageName: "img_walkthrough_2",
                                                                       title: L10n.Modules.WalkThrough.secondTitle,
                                                                       description: L10n.Modules.WalkThrough.descriptionText),
                                                   OnboardingViewModel(imageName: "img_walkthrough_3",
                                                                       title: L10n.Modules.WalkThrough.thirdTitle,
                                                                       description: L10n.Modules.WalkThrough.descriptionText),
                                                   OnboardingViewModel(imageName: "img_walkthrough_4",
                                                                       title: L10n.Modules.WalkThrough.fourthTitle,
                                                                       description: L10n.Modules.WalkThrough.descriptionText)]
}
