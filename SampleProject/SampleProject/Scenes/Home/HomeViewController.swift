//
//  HomeViewController.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import UIKit
import StoreKit
import Segmentio

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private lazy var segmentView: Segmentio = {
        let segmentView = Segmentio()
        segmentView.selectedSegmentioIndex = 0
        segmentView.setup(content: [SegmentioItem(title: viewModel.segmentedControlTitles[0], image: nil),
                                    SegmentioItem(title: viewModel.segmentedControlTitles[1], image: nil)], style: .onlyLabel, options: .options())
        return segmentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
        self.viewModel.listType = .editorChoiceRecipes
        setSegmentHandler()
    }
    
    func setupViews() {
        view.addSubview(segmentView)
        view.backgroundColor = .appSecondaryBackground
    }
    
    func setupLayouts() {
        segmentView.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
        segmentView.height(46)
    }
}

// MARK: - Helper
extension HomeViewController {
    func setSegmentHandler() {
        segmentView.valueDidChange = { [weak self] _, segmentIndex in
            guard let self = self else { return }
            if segmentIndex == 0 {
                self.viewModel.listType = .editorChoiceRecipes
            } else if segmentIndex == 1 {
                self.viewModel.listType = .lastAddedRecipes
            }
        }
    }
}
