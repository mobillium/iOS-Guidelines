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
        setCollectionView()
        setupViews()
        setupLayouts()
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
        view.addSubview(collectionView)
        view.backgroundColor = .appSecondaryBackground
    }
    
    func setupLayouts() {
        collectionView.edgesToSuperview()
    }
    
    func setCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RecipeCell.self)
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
