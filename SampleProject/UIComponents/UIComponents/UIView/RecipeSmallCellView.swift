//
//  CategoryRecipesViewController.swift
//  UIComponents
//
//  Created by Murat Celebi on 25.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

final public class RecipeSmallCellView: UIView {
    
    public let collecitonView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    var didSelectRecipe: IntClosure?
    
    public var cellItems: [RecipeSmallCellProtocol]? {
        didSet {
            self.collecitonView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureConstraints()
        configureCollectionView()
    }
    
    private func configureConstraints() {
        backgroundColor = .red
        addSubview(collecitonView)
        collecitonView.edgesToSuperview(usingSafeArea: true)
    }
    
    private func configureCollectionView() {
        collecitonView.dataSource = self
        collecitonView.delegate = self
        collecitonView.register(RecipeSmallCell.self)
    }
}

// MARK: - UICollectionView DataSource
extension RecipeSmallCellView: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellItems?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RecipeSmallCell = collectionView.dequeueReusableCell(for: indexPath)
        if let cellItem = cellItems?[indexPath.item] {
            cell.set(with: cellItem)
        }
        return cell
    }
}

// MARK: - UICollectionView Delegate
extension RecipeSmallCellView: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cellItem = cellItems?[indexPath.row] else { return }
        didSelectRecipe?(cellItem.recipeId)
    }
}

// MARK: - UICollectionView Delegate FlowLayout
extension RecipeSmallCellView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 195)
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 15, bottom: 0, right: 15)
    }
}
