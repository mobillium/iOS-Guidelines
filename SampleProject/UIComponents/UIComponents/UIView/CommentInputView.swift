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
        .backgroundColor(.appHeather)
        .image(.icSend, for: .normal)
        .tintColor(.appWhite)
        .build()
    
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
    
    private func addSubViews() {
        self.backgroundColor = .clear
        
        self.addSubview(textView)
        textView.addSubview(placeholderLabel)
        self.addSubview(sendButton)
        
        textView.delegate = self
        
        placeholderLabel.edgesToSuperview(excluding: [.leading, .top])
        placeholderLabel.topToSuperview().constant = 12
        placeholderLabel.leadingToSuperview().constant = 18
        
        textView.edgesToSuperview(excluding: [.trailing, .leading])
        textView.leadingToSuperview().constant = 15
        textView.trailingToLeading(of: sendButton).constant = -15
        textView.height(40, relation: .equalOrGreater)
        textView.textContainerInset = UIEdgeInsets(top: 12, left: 15, bottom: 10, right: 10)
        
        sendButton.height(40)
        sendButton.width(40)
        sendButton.leadingToTrailing(of: textView).constant = 15
        sendButton.bottomToSuperview()
        sendButton.trailingToSuperview().constant = -15
        
        sendButton.addTarget(self, action: #selector(touchUpInside(_:)), for: .touchUpInside)
    }
    
}

// MARK: - Actions
extension CommentInputView {
    
    @IBAction private func touchUpInside(_ sender: UIButton) {
        switch sender {
        case sendButton:
            print(textView.text)
        default:
            break
        }
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
