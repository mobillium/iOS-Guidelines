//
//  FoodDetailViewModel.swift
//  SampleProject
//
//  Created by Emirhan Battalbaş on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

protocol FoodDetailViewDataSource {}

protocol FoodDetailViewEventSource {}

protocol FoodDetailViewProtocol: FoodDetailViewDataSource, FoodDetailViewEventSource {}

final class FoodDetailViewModel: BaseViewModel<FoodDetailRouter>, FoodDetailViewProtocol {
    
    
}
