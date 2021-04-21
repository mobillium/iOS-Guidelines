//
//  FavoritesViewController.swift
//  SampleProject
//
//  Created by Hüseyin Özgür on 20.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

final class FavoritesViewController: BaseViewController<FavoritesViewModel> {
    
    private let collectionView = UICollectionViewBuilder()
        .showsVerticalScrollIndicator(false)
        .showsHorizontalScrollIndicator(false)
        .backgroundColor(.clear)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setupViews()
        setupLayouts()
        fetchData()
        viewModel.categoryWithRecipesClosure = { [weak self] categoryWithRecipesClosure in
            guard let self = self else { return }
            if categoryWithRecipesClosure {
                self.collectionView.reloadData()
            }
        }
    }
    
    func setupViews() {
        view.addSubview(collectionView)
        view.backgroundColor = .appSecondaryBackground
    }
    
    func setupLayouts() {
        collectionView.edgesToSuperview()
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryWithRecipesCell.self)
    }
    
    func fetchData() {
        viewModel.getCategoryWithRecipes(categoryWithRecipesClosure: true)
    }
}

extension FavoritesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.mainCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CategoryWithRecipesCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellViewModel = viewModel.getCategoryWithRecipesCellModel(indexRow: indexPath.row)
        cell.set(with: cellViewModel)
        return cell
    }
}

extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = width * 270 / 375
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
