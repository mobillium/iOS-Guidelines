//
//  RecipesViewController.swift
//  Fodamy
//
//  Created by Catalina on 7.01.2021.
//

import UIKit

final class RecipesViewController: BaseViewController<RecipesViewModel> {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collectionView.backgroundColor = .gray
        collectionView.register(CategoryWithRecipesCell.self)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        setupCollectionView()
        viewModel.addDummyData()
    }
    
    private func setupConstraints() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(usingSafeArea: true)
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }

}

extension RecipesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryWithRecipesCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.set(with: viewModel.cellItem(for: indexPath))
        return cell
    }
}

extension RecipesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension RecipesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: view.frame.size.width, height: 270)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}
