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
    
    private let bottomView = UIViewBuilder()
        .backgroundColor(.clear)
        .build()
    
    private let commentTextView: UITextView = {
        let textView = UITextView()
        textView.font = .font(.nunitoSemiBold, size: .large)
        textView.textColor = .appRaven
        textView.layer.borderWidth = 2
        textView.layer.borderColor = UIColor.appZircon.cgColor
        textView.layer.cornerRadius = 20
        textView.clipsToBounds = true
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10)
        textView.sizeToFit()
        textView.isScrollEnabled = false
        return textView
    }()
    
    private let sendButton = UIButtonBuilder()
        .cornerRadius(20)
        .clipsToBounds(true)
        .backgroundColor(.appRed)
        .image(UIImage.icSend.withRenderingMode(.alwaysTemplate))
        .tintColor(.appWhite)
        .build()
    
    private let refreshControl = UIRefreshControl()
    
    private let keyboardHelper = KeyboardHelper()
    private var bottomViewBottomConstraint: NSLayoutConstraint?
    var isKeyboardOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = viewModel.title
        keyboardHelper.delegate = self
        configureContents()
        setupCollectionView()
        addButtonTarget()
        setupRefreshControl()
        viewModel.fetchComments()
        subscribeViewModelEvents()
        setupKeyboard()
    }
    
    private func configureContents() {
        view.addSubview(bottomView)
        bottomView.widthToSuperview()
        bottomViewBottomConstraint = bottomView.bottomToSuperview(usingSafeArea: true)
        bottomViewBottomConstraint?.isActive = true
        
        bottomView.addSubview(commentTextView)
        commentTextView.topToSuperview(bottomView.topAnchor, offset: 10, priority: .defaultLow)
        commentTextView.edgesToSuperview(excluding: [.right, .top], insets: UIEdgeInsets(top: 0, left: 15, bottom: 10, right: 0))
        
        bottomView.addSubview(sendButton)
        sendButton.trailingToSuperview(offset: 15)
        sendButton.centerYToSuperview()
        sendButton.leftToRight(of: commentTextView, offset: 15)
        sendButton.size(.init(width: 40, height: 40))
        
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
        collectionView.bottomToTop(of: bottomView)
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset.bottom = 15
        collectionView.refreshControl = refreshControl
    }
    
    private func addButtonTarget() {
        sendButton.addTarget(self, action: #selector(sendButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func sendButtonDidTap() {
        guard let commentText = commentTextView.text, !commentText.isEmpty else {
            showWarningToast(message: L10n.Error.empty("Yorum"))
            return
        }
        viewModel.sendButtonDidTap(commentText: commentText)
    }
    
    private func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(pullToRefreshValueChanged), for: .valueChanged)
    }
    
    @objc
    private func pullToRefreshValueChanged() {
        viewModel.cellItems.isEmpty ? viewModel.fetchComments() : collectionView.reloadData()
        refreshControl.endRefreshing()
    }
    
    private func subscribeViewModelEvents() {
        viewModel.fetchCommentsDidSuccess = { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
        
        viewModel.postCommentDidSuccess = { [weak self] in
            guard let self = self else { return }
            self.commentTextView.text = ""
            self.view.endEditing(true)
        }
        
        viewModel.deleteCommentDidSuccess = { [weak self] indexPath in
            guard let self = self else { return }
            self.collectionView.deleteItems(at: [indexPath])
        }
    }
    
    private func setupKeyboard() {
        if isKeyboardOpen {
            commentTextView.becomeFirstResponder()
        }
    }
    
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
    
}

// swiftlint:disable line_length
// MARK: - UICollectionViewDelegateFlowLayout
extension CommentListViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
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
