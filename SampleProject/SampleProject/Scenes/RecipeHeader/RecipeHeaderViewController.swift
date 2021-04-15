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
        .estimatedItemSize(CGSize(width: 100, height: 100))
        .backgroundColor(.red)
        .registerCell(RecipeHeaderCell.self, reuseIdentifier: "RecipeHeaderCell")
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension RecipeHeaderViewController: UICollectionViewDelegate {
    
}

extension RecipeHeaderViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.recipeHeaderData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RecipeHeaderCell = collectionView.dequeueReusableCell(for: indexPath)
        let currentRecipeHeaderModel = viewModel.recipeHeaderData[indexPath.row]
        cell.set(with: currentRecipeHeaderModel)
        return cell
    }
}

extension RecipeHeaderViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = UIScreen.main.bounds.width
        return CGSize(width: size, height: size)
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
