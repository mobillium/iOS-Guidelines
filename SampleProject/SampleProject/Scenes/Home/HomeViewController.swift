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
        let segmentedControl = AppSegmentedControl(titles: viewModel.segmentedControlTitles, backgroundColor: .appWhite)
        segmentedControl.addTarget(self,
                                   action: #selector(segmentedControlValueChanged(_:)),
                                   for: .valueChanged)
        return segmentedControl
    }()
    
    private let collectionView = UICollectionViewBuilder()
        .showsVerticalScrollIndicator(false)
        .showsHorizontalScrollIndicator(false)
        .backgroundColor(.clear)
        .build()

    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setupViews()
        setupLayouts()
        
        viewModel.getRecipes()
        
        viewModel.recipesClosure = { [weak self] isTypeChanged in
            guard let self = self else { return }
            if isTypeChanged {
                self.collectionView.scrollToItem(at: IndexPath(row: 0, section: 0),
                                                 at: .top,
                                                 animated: true)
            }
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
    
    func setCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RecipeCell.self)
    }
}

// MARK: - Action
@objc
extension HomeViewController {
    func segmentedControlValueChanged(_ sender: AppSegmentedControl) {
        if sender.selectedIndex == 0 {
            viewModel.listType = .editorChoiceRecipes
        } else if sender.selectedIndex == 1 {
            viewModel.listType = .lastAddedRecipes
        }
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
        return UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = width * 520 / 375
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.viewModel.lastPage >= self.viewModel.currentPage + 1 {
            if ((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height) && !viewModel.isLoadingList {
                self.viewModel.currentPage += 1
            }
        }
    }
}
// swiftlint:enable line_length
