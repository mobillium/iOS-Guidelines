//
//  RecipeHeaderViewController.swift
//  SampleProject
//
//  Created by Emirhan Battalbaş on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

final class RecipeHeaderViewController: BaseViewController<RecipeHeaderViewModel> {
    
    lazy var collectionView = UICollectionViewBuilder()
        .allowsMultipleSelection(false)
        .scrollDirection(.horizontal)
        .backgroundColor(.appWhite)
        .isPagingEnabled(true)
        .registerCell(RecipeHeaderCell.self, reuseIdentifier: "RecipeHeaderCell")
        .build()

    lazy var pageControl = UIPageControlBuilder()
        .numberOfPages(viewModel.recipeHeaderData.count)
        .build()

    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setPageControl()
    }

    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        view.addSubview(collectionView)
        collectionView.edgesToSuperview()
    }

    private func setPageControl() {
        view.addSubview(pageControl)
        pageControl.bottom(to: collectionView)
        pageControl.centerX(to: collectionView)
    }

}

extension RecipeHeaderViewController: UICollectionViewDelegate {
    
}

extension RecipeHeaderViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RecipeHeaderCell = collectionView.dequeueReusableCell(for: indexPath)
        let currentRecipeHeaderModel = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(with: currentRecipeHeaderModel)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }

}

extension RecipeHeaderViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }

}
