//
//  FavoritesViewController.swift
//  SampleProject
//
//  Created by Hüseyin Özgür on 20.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit
import KeychainSwift
import MobilliumUserDefaults

final class FavoritesViewController: BaseViewController<FavoritesViewModel> {
    
    private let collectionView = UICollectionViewBuilder()
        .showsVerticalScrollIndicator(false)
        .showsHorizontalScrollIndicator(false)
        .backgroundColor(.clear)
        .build()
    
    private let refreshControl = UIRefreshControl()
    private let keychain = KeychainSwift()
    private var loadingFooterView: ActivityIndicatorFooterView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationBarLogo()
        addSubViews()
        configureContents()
        viewModel.fetchCategories()
        subscribeViewModelEvents()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkIsUserLogin()
    }
    
    private func subscribeViewModelEvents() {
        viewModel.didSuccessFetchCategories = { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
        
        viewModel.didSuccesLogout = { [weak self] in
            guard let self = self else { return }
            self.keychain.clear()
            DefaultsKey.userId.remove()
            self.navigationItem.rightBarButtonItem = .none
        }
    }
    
}
// MARK: - UILayout
extension FavoritesViewController {
    
    private func addSubViews() {
        view.addSubview(collectionView)
        view.backgroundColor = .appSecondaryBackground
        collectionView.edgesToSuperview(usingSafeArea: true)
        refreshControl.addTarget(self, action: #selector(pullToRefreshValueChanged), for: .valueChanged)
    }
}

// MARK: - Configure
extension FavoritesViewController {
    
    private func configureContents() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryWithRecipesCell.self)
        collectionView.registerFooter(ActivityIndicatorFooterView.self)
        collectionView.refreshControl = refreshControl
    }
}

// MARK: - Actions
extension FavoritesViewController {
    
    @objc
    private func pullToRefreshValueChanged() {
        viewModel.cellItems.isEmpty ? viewModel.fetchCategories() : collectionView.reloadData()
        refreshControl.endRefreshing()
    }
}

// MARK: - ScrollViewDelegate
extension FavoritesViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height && viewModel.isPagingEnabled && viewModel.isRequestEnabled {
            viewModel.fetchMorePages()
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

// MARK: - UICollectionViewDataSource
extension FavoritesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CategoryWithRecipesCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellViewModel = viewModel.cellItem(for: indexPath)
        cellViewModel.didSelectRecipe = { [weak self] id in
            self?.viewModel.didSelectRecipe(recipeId: id)
        }
        cellViewModel.seeAllButtonTapped = { [weak self] (id, title) in
            self?.viewModel.seeAllButtonTapped(categoryId: id, title: title)
        }
        cell.set(with: cellViewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let footer: ActivityIndicatorFooterView = collectionView.dequeueReusableCell(ofKind: kind, for: indexPath)
        loadingFooterView = footer
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplaySupplementaryView view: UICollectionReusableView,
                        forElementKind elementKind: String,
                        at indexPath: IndexPath) {
        
        if elementKind == UICollectionView.elementKindSectionFooter {
            self.loadingFooterView?.activityIndicator.startAnimating()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didEndDisplayingSupplementaryView view: UICollectionReusableView,
                        forElementOfKind elementKind: String,
                        at indexPath: IndexPath) {
        
        if elementKind == UICollectionView.elementKindSectionFooter {
            self.loadingFooterView?.activityIndicator.stopAnimating()
        }
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
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        
        let height: CGFloat = viewModel.isPagingEnabled ? 100 : 0
        return CGSize(width: collectionView.bounds.size.width, height: height)
    }
}
