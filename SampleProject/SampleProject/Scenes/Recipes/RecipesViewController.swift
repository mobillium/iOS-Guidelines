//
//  RecipesViewController.swift
//  SampleProject
//
//  Created by Burak Kaya on 15.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

final class RecipesViewController: BaseViewController<RecipesViewModel> {
    
    private let collectionView = UICollectionViewBuilder()
        .showsVerticalScrollIndicator(false)
        .showsHorizontalScrollIndicator(false)
        .backgroundColor(.clear)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureContents()
        subscribeViewModelEvents()
    }
    
    private func configureContents() {
        view.addSubview(collectionView)
        view.backgroundColor = .appSecondaryBackground
        collectionView.edgesToSuperview()
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RecipeCell.self)
    }
    
    private func subscribeViewModelEvents() {
        viewModel.recipesClosure = { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension RecipesViewController: UICollectionViewDataSource {
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

// MARK: - UICollectionViewDelegate
extension RecipesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectRecipe(at: indexPath)
    }
}

// swiftlint:disable line_length
// MARK: - UICollectionViewDelegateFlowLayout
extension RecipesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWitdh = view.frame.width
        let recipeImageHeight = cellWitdh - 30
        let otherCellItemsHeight = CGFloat(175)
        let cellHeight = recipeImageHeight + otherCellItemsHeight
        return CGSize(width: cellWitdh, height: cellHeight)
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
