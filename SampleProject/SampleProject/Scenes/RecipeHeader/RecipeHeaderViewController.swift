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
        .backgroundColor(.clear)
        .isPagingEnabled(true)
        .showsHorizontalScrollIndicator(false)
        .registerCell(RecipeHeaderCell.self, reuseIdentifier: "RecipeHeaderCell")
        .build()

    lazy var pageControl = UIPageControlBuilder()
        .numberOfPages(viewModel.numberOfItemsAt())
        .build()

    // swiftlint:disable weak_delegate
    var photoBrowserDelegate: PhotoBrowserDelegate?
    // swiftlint:enable weak_delegate

    override func viewDidLoad() {
        super.viewDidLoad()
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
        view.addSubview(collectionView)
        collectionView.edgesToSuperview()
    }

    private func setPageControl() {
        view.addSubview(pageControl)
        pageControl.bottom(to: collectionView)
        pageControl.centerX(to: collectionView)
    }

}

// MARK: - UICollectionViewDelegate
extension RecipeHeaderViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let delegate = photoBrowserDelegate else { return }
        viewModel.didSelectItem(indexPath: indexPath, delegate: delegate)
    }
    
}

// MARK: - UICollectionViewDataSource
extension RecipeHeaderViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RecipeHeaderCell = collectionView.dequeueReusableCell(for: indexPath)
        let currentRecipeHeaderModel = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(with: currentRecipeHeaderModel)
        return cell
    }

}

// MARK: - UICollectionViewDelegateFlowLayout
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

// MARK: - UIScrollViewDelegate
extension RecipeHeaderViewController {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }

}
