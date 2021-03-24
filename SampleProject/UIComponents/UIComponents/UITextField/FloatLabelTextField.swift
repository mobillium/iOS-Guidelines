//
//  FloatLabelTextField.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 22.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

public class FloatLabelTextField: UITextField {
    
    private let titleLabel = UILabel()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .appCinder
        return imageView
    }()
    
    public var title: String? {
        willSet {
            placeholder = nil
            attributedPlaceholder = nil
            titleLabel.text = newValue
            titleLabel.sizeToFit()
        }
    }
    
    public var leftImage: UIImage? {
        willSet {
            if let image = newValue {
                imageView.image = image.withRenderingMode(.alwaysTemplate)
                leftView = imageView
                leftViewMode = .always
            } else {
                imageView.image = nil
                leftView = nil
                leftViewMode = .never
            }
        }
    }
    
    private var insets: UIEdgeInsets {
        var insets = UIEdgeInsets(top: 29, left: 15, bottom: 12, right: 15)
        if let leftView = leftView {
            insets.left += leftView.frame.size.width + 10
        }
        return insets
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    public override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x = 15
        rect.origin.y = 21
        return rect
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        placeholder = nil
        attributedPlaceholder = nil
        updateTitlePosition()
        if isFirstResponder || !text!.isEmpty {
            setTitleToTop(animate: true)
        } else {
            setTitleToCenter(animate: true)
        }
        layer.borderColor = isFirstResponder ? UIColor.appRed.cgColor : UIColor.appZircon.cgColor
    }
    
    private func configureContents() {
        addSubview(titleLabel)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        borderStyle = .none
        layer.borderWidth = 2
        layer.cornerRadius = 4
        layer.borderColor = UIColor.appZircon.cgColor
        font = .systemFont(ofSize: 14, weight: .semibold)
        textColor = .appRaven
    }
    
    private func updateTitlePosition() {
        titleLabel.frame.origin.x = insets.left
        titleLabel.frame.size.width = frame.size.width - insets.left - insets.right
    }
    
    private func setTitleToTop(animate: Bool) {
        guard animate else { return }
        UIView.animate(withDuration: 0.25, delay: 0, options: [.beginFromCurrentState, .curveEaseOut], animations: { [weak self] in
            self?.configureTitleForTop()
        }, completion: nil)
    }
    
    private func setTitleToCenter(animate: Bool) {
        guard animate else { return }
        UIView.animate(withDuration: 0.25, delay: 0, options: [.beginFromCurrentState, .curveEaseIn], animations: { [weak self] in
            self?.configureTitleForCenter()
        }, completion: nil)
    }
    
    private func configureTitleForTop() {
        let contentHeight = frame.size.height
        let titleHeight = titleLabel.frame.size.height
        titleLabel.font = .systemFont(ofSize: 12, weight: .bold)
        titleLabel.textColor = .appRed
        titleLabel.frame.origin.y = (contentHeight / 2) - titleHeight
    }
    
    private func configureTitleForCenter() {
        let contentHeight = frame.size.height
        let titleHeight = titleLabel.frame.size.height
        titleLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        titleLabel.textColor = .appHeather
        titleLabel.frame.origin.y = (contentHeight / 2) - (titleHeight / 2)
    }
}
