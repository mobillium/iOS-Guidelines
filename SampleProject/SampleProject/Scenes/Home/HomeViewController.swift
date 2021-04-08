//
//  HomeViewController.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import UIKit
import StoreKit

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    lazy var segmentedControl: AppSegmentedControl = {
        let segmentedControl = AppSegmentedControl(titles: viewModel.segmentedControlTitles)
        segmentedControl.addTarget(self,
                                   action: #selector(segmentedControlValueChanged(_:)),
                                   for: .valueChanged)
        return segmentedControl
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(RecipeCell.self)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
        
        viewModel.getRecipes {
            self.collectionView.reloadData()
        }
    }
    
    func setupViews() {
        view.addSubview(segmentedControl)
        view.addSubview(collectionView)
        view.backgroundColor = .appSecondaryBackground
    }
    
    func setupLayouts() {
        segmentedControl.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
        segmentedControl.height(46)
        
        collectionView.topToBottom(of: segmentedControl)
        collectionView.edgesToSuperview(excluding: .top)
    }
}

// MARK: - Action
@objc
extension HomeViewController {
    func segmentedControlValueChanged(_ sender: AppSegmentedControl) {
        print(sender.selectedIndex)
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.recipeCellModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RecipeCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellViewModel = viewModel.recipeCellModels[indexPath.row]
        cell.set(viewModel: cellViewModel)
        return cell
    }
    
}

// swiftlint:disable line_length
// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
}
// swiftlint:enable line_length
