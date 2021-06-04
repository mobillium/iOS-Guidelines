//
//  RecipeHeaderView.swift
//  SampleProject
//
//  Created by Emirhan Battalbaş on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

final class RecipeDetailHeaderView: UIView {
    
    lazy var collectionView = UICollectionViewBuilder()
        .allowsMultipleSelection(false)
        .scrollDirection(.horizontal)
        .backgroundColor(.clear)
        .isPagingEnabled(true)
        .showsHorizontalScrollIndicator(false)
        .registerCell(RecipeHeaderCell.self, reuseIdentifier: "RecipeHeaderCell")
        .build()
    
    lazy var pageControl = UIPageControlBuilder()
        .numberOfPages(recipeHeaderData.count)
        .build()
    
    // swiftlint:disable weak_delegate
    var photoBrowserDelegate: PhotoBrowserDelegate?
    // swiftlint:enable weak_delegate
    
    var recipeHeaderData: [RecipeHeaderCellProtocol] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCollectionView()
        setPageControl()
        setPhotoBrowserDelegate()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCollectionView()
        setPageControl()
        setPhotoBrowserDelegate()
    }
    
    private func setPhotoBrowserDelegate() {
        photoBrowserDelegate = PhotoBrowserDelegate()
        photoBrowserDelegate?.willDismissAtPage = { [weak self] (index) in
            guard let self = self else { return }
            let indexPath = IndexPath(item: index, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.pageControl.currentPage = index
        }
    }
    
    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        addSubview(collectionView)
        collectionView.edgesToSuperview()
    }
    
    private func setPageControl() {
        addSubview(pageControl)
        pageControl.bottom(to: collectionView)
        pageControl.centerX(to: collectionView)
    }
    
}

// MARK: - UICollectionViewDelegate
extension RecipeDetailHeaderView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let delegate = photoBrowserDelegate else { return }
        let photos = recipeHeaderData.map { $0.imageUrl }
        AppRouter.shared.presentSKPhotoBrowser(with: photos, delegate: delegate, initialPageIndex: indexPath.row)
    }
    
}

// MARK: - UICollectionViewDataSource
extension RecipeDetailHeaderView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeHeaderData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RecipeHeaderCell = collectionView.dequeueReusableCell(for: indexPath)
        let currentRecipeHeaderModel = recipeHeaderData[indexPath.row]
        cell.set(with: currentRecipeHeaderModel)
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RecipeDetailHeaderView: UICollectionViewDelegateFlowLayout {
    
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

// MARK: - UIScrollViewDelegate
extension RecipeDetailHeaderView {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
}