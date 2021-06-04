//
//  CommentInputView.swift
//  UIComponents
//
//  Created by emirhan Acısu on 15.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation
import MobilliumBuilders

public class CommentInputView: UIView {
    
    private let textView = UITextViewBuilder()
        .backgroundColor(.white)
        .font(.font(.nunitoSemiBold, size: .large))
        .textColor(.appRaven)
        .borderWidth(2)
        .borderColor(UIColor.appZircon.cgColor)
        .cornerRadius(20)
        .isScrollEnabled(false)
        .textContainerInset(UIEdgeInsets(top: 12, left: 15, bottom: 10, right: 10))
        .build()
    
    private let placeholderLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .large))
        .textColor(.appRaven)
        .text(L10n.Componenets.Comment.placeholder)
        .build()
    
    private let sendButton = UIButtonBuilder()
        .cornerRadius(20)
        .clipsToBounds(true)
        .backgroundColor(.appRed)
        .image(UIImage.icSend.withRenderingMode(.alwaysTemplate))
        .tintColor(.appWhite)
        .build()
    
    public var textViewText: String? {
        willSet {
            textView.text = newValue
        }
    }
    
    public var isKeyboardOpen: Bool? {
        didSet {
            textView.becomeFirstResponder()
        }
    }
    
    public var sendButtonTappedCallBack: StringClosure?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        addSubViews()
    }
}

// MARK: - UILayout
extension CommentInputView {
    
    private func addSubViews() {
        textView.delegate = self
        backgroundColor = .clear
        addSubview(textView)
        textView.topToSuperview(topAnchor, offset: 10, priority: .defaultLow)
        textView.edgesToSuperview(excluding: [.right, .top], insets: UIEdgeInsets(top: 0, left: 15, bottom: 10, right: 0))
        
        textView.addSubview(placeholderLabel)
        placeholderLabel.edgesToSuperview(excluding: [.leading, .top])
        placeholderLabel.topToSuperview().constant = 12
        placeholderLabel.leadingToSuperview().constant = 18
            
        addSubview(sendButton)
        sendButton.trailingToSuperview(offset: 15)
        sendButton.centerYToSuperview()
        sendButton.leftToRight(of: textView, offset: 15)
        sendButton.size(.init(width: 40, height: 40))
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension CommentInputView {
    
    @objc
    private func sendButtonTapped() {
        textViewText = textView.text
        sendButtonTappedCallBack?(textViewText ?? "")
    }
}

// MARK: - UITextViewDelegate
extension CommentInputView: UITextViewDelegate {
    public func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
    public func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            sendButton.backgroundColor = .gray
            placeholderLabel.isHidden = false
        } else {
            sendButton.backgroundColor = .red
            placeholderLabel.isHidden = true
        }
    }
    
}
