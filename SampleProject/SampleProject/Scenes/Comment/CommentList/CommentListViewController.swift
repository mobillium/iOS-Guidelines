//
//  CommentListViewController.swift
//  SampleProject
//
//  Created by Murat Celebi on 31.05.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

final class CommentListViewController: BaseViewController<CommentListViewModel> {

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let width = UIScreen.main.bounds.size.width
        layout.estimatedItemSize = CGSize(width: width, height: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .appSecondaryBackground
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.register(CommentCell.self)
        return collectionView
    }()

    private let commentInputView = CommentInputView()
    
    private let refreshControl = UIRefreshControl()
    private var loadingFooterView: ActivityIndicatorFooterView?
    
    private let keyboardHelper = KeyboardHelper()
    private var bottomViewBottomConstraint: NSLayoutConstraint?
    var isKeyboardOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        viewModel.fetchComments()
        subscribeViewModel()
        setSendButtonAction()
    }
    
    private func subscribeViewModel() {
        viewModel.reloadData = { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
        
        viewModel.postCommentDidSuccess = { [weak self] in
            guard let self = self else { return }
            self.commentInputView.textViewText = ""
            self.view.endEditing(true)
            self.viewModel.postNotification()
        }
        
        viewModel.deleteCommentDidSuccess = { [weak self] indexPath in
            guard let self = self else { return }
            self.collectionView.deleteItems(at: [indexPath])
            self.viewModel.postNotification()
        }
    }
}

// MARK: - UILayout
extension CommentListViewController {
    
    private func addSubViews() {
        addCollectionView()
        addCommentInputView()
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
        refreshControl.addTarget(self, action: #selector(pullToRefreshValueChanged), for: .valueChanged)
    }
    
    private func addCommentInputView() {
        view.addSubview(commentInputView)
        commentInputView.topToBottom(of: collectionView)
        commentInputView.edgesToSuperview(excluding: [.top, .bottom])
        bottomViewBottomConstraint = commentInputView.bottomToSuperview(usingSafeArea: true)
        bottomViewBottomConstraint?.isActive = true
    }
}

// MARK: - Configure
extension CommentListViewController {
    
    private func configureContents() {
        navigationItem.title = viewModel.title
        keyboardHelper.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset.bottom = 15
        collectionView.refreshControl = refreshControl

        if isKeyboardOpen {
            commentInputView.isKeyboardOpen = true
        }
    }
}

// MARK: - Actions
extension CommentListViewController {
    
    private func setSendButtonAction() {
        commentInputView.sendButtonTappedCallBack = { [weak self] text in
            guard let self = self else { return }
            guard !text.isEmpty else {
                self.showWarningToast(message: L10n.Error.empty(L10n.Error.Key.comment))
                return
            }
            self.viewModel.sendButtonTapped(commentText: text)
        }
    }
    
    @objc
    private func pullToRefreshValueChanged() {
        viewModel.cellItems.isEmpty ? viewModel.fetchComments() : collectionView.reloadData()
        refreshControl.endRefreshing()
    }
}

// MARK: - ScrollViewDelegate
extension CommentListViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height && viewModel.isPagingEnabled && viewModel.isRequestEnabled {
            viewModel.fetchMorePages()
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
}

// MARK: - UICollectionViewDataSource
extension CommentListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CommentCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        
        cellItem.moreButtonTapped = { [weak self] in
            guard let self = self else { return }
            self.viewModel.moreButtonTapped(at: indexPath)
        }
        
        cell.set(with: cellItem)
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

// swiftlint:disable line_length
// MARK: - UICollectionViewDelegateFlowLayout
extension CommentListViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        
        let height: CGFloat = viewModel.isPagingEnabled ? 100 : 0
        return CGSize(width: collectionView.bounds.size.width, height: height)
    }
}
// swiftlint:enable line_length

// MARK: - KeyboardHelper Delegate
extension CommentListViewController: KeyboardHelperDelegate {
    
    func keyboardWillShow(_ keyboardHeight: CGFloat) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            self.bottomViewBottomConstraint?.constant = self.view.safeAreaInsets.bottom - keyboardHeight
            self.view.layoutIfNeeded()
        }
    }
    
    func keyboardWillHide() {
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
            self.bottomViewBottomConstraint?.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}
