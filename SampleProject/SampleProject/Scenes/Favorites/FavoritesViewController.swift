//
//  FavoritesViewController.swift
//  SampleProject
//
//  Created by Hüseyin Özgür on 20.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit
import KeychainSwift

final class FavoritesViewController: BaseViewController<FavoritesViewModel> {
    
    private let collectionView = UICollectionViewBuilder()
        .showsVerticalScrollIndicator(false)
        .showsHorizontalScrollIndicator(false)
        .backgroundColor(.clear)
        .build()
    
    private let keychain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationBarLogo()
        configureCollectionView()
        configureContents()
        fetchData()
        viewModel.categoryWithRecipesClosure = { [weak self] categoryWithRecipesClosure in
            guard let self = self else { return }
            if categoryWithRecipesClosure {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkIsUserLogin()
    }
    
    private func configureContents() {
        view.addSubview(collectionView)
        view.backgroundColor = .appSecondaryBackground
        collectionView.edgesToSuperview(usingSafeArea: true)
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

// MARK: - UICollectionViewDataSource
extension FavoritesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.mainCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CategoryWithRecipesCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellViewModel = viewModel.getCategoryWithRecipesCellModel(indexRow: indexPath.row)
        cellViewModel.didSelectRecipe = { [weak self] id in
            self?.viewModel.didSelectRecipe(recipeId: id)
        }
        cellViewModel.seeAllButtonTapped = { [weak self] (id, _) in
            self?.viewModel.tapSeeAllButton(categoryId: id)
        }
        cell.set(with: cellViewModel)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FavoritesViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWitdh = view.frame.width
        let cellHeight = CGFloat(270)
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

// MARK: - Logout
extension FavoritesViewController {
    
    private func setupLogoutRightBarButton() {
        let logoutBarButton = UIBarButtonItem(image: .icLogout, style: .done, target: self, action: #selector(logoutBarButtonDidTap))
        navigationItem.rightBarButtonItem = logoutBarButton
    }
    
    private func checkIsUserLogin() {
        if keychain.get(Keychain.token) != nil {
            setupLogoutRightBarButton()
        } else {
            navigationItem.rightBarButtonItem = .none
        }
    }
    
    @IBAction private func logoutBarButtonDidTap() {
        viewModel.userLogout()
    }
}
