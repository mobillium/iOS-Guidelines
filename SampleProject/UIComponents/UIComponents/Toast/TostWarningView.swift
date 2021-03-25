//
//  TostWarningView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 24.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

class TostWarningView: UIView {
    
    private let label = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .large))
        .textColor(.appWhite)
        .textAlignment(.center)
        .numberOfLines(0)
        .build()
    
    init(text: String) {
        label.text = text
        label.sizeToFit()
        super.init(frame: .zero)
        configureContents()
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    private func configureContents() {
        addSubview(label)
        label.edgesToSuperview(insets: .init(top: 14, left: 14, bottom: 14, right: 14))
    }
    
}
