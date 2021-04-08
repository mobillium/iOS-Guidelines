//
//  WalkThroughViewController.swift
//  SampleProject
//
//  Created by Murat Celebi on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

final class WalkThroughViewController: BaseViewController<WalkThroughViewModel> {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.register(WalkThroughCell.self)
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private let pageControl = UIPageControlBuilder<PageControl>()
        .numberOfPages(4)
        .build()
    
    private let nextButton = ButtonFactory.createPrimaryButton(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        configureCollectionView()
        addButtonTarget()
        viewModel.configureCellItems()
    }
    
    private func configureContents() {
        view.backgroundColor = .white
        
        view.addSubview(nextButton)
        nextButton.edgesToSuperview(excluding: .top, insets: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15), usingSafeArea: true)
        nextButton.setTitle(L10n.Modules.WalkThrough.next, for: .normal)
        
        view.addSubview(pageControl)
        pageControl.bottomToTop(of: nextButton).constant = -20
        pageControl.centerXToSuperview()
        
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(excluding: [.bottom], usingSafeArea: true)
        collectionView.bottomToTop(of: pageControl).constant = -60
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func addButtonTarget() {
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        pageControl.addTarget(self, action: #selector(pageControlValueChanged), for: .touchUpInside)
    }
    
    @IBAction private func nextButtonTapped() {
        if pageControl.currentPage == viewModel.numberOfItemsAt(section: 0) - 1 {
            viewModel.didFinishWalkThroughScene()
        }
        
        let nextIndex = min(pageControl.currentPage + 1, viewModel.numberOfItemsAt(section: 0) - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @IBAction private func pageControlValueChanged(_ sender: UIPageControl) {
        let current = sender.currentPage
        collectionView.setContentOffset(CGPoint(x: view.frame.width * CGFloat(current), y: 0), animated: true)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let xPoint = targetContentOffset.pointee.x
        let pageIndex = Int(xPoint / view.frame.width)
        pageControl.currentPage = pageIndex
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if pageControl.currentPage == viewModel.numberOfItemsAt(section: 0) - 1 {
            nextButton.setTitle(L10n.Modules.WalkThrough.start, for: .normal)
        } else {
            nextButton.setTitle(L10n.Modules.WalkThrough.next, for: .normal)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension WalkThroughViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: WalkThroughCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
    
}

// swiftlint:disable line_length
// MARK: - UICollectionViewDelegateFlowLayout
extension WalkThroughViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
}
// swiftlint:enable line_length
