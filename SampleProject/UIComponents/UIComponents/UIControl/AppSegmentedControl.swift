//
//  AppSegmentedControl.swift
//  UIComponents
//
//  Created by Burak Kaya on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

public class AppSegmentedControl: UIControl {
    
    fileprivate var labels = [UILabel]()
    var thumbView = UIViewBuilder().cornerRadius(4).build()

    var items: [String] = [] {
        didSet {
            setupLabels()
        }
    }
    
    public var selectedIndex: Int = 0 {
        didSet {
            displayNewSelectedIndex()
        }
    }
    
    var selectedLabelColor: UIColor = .black {
        didSet {
            setSelectedColors()
        }
    }
    
    var unselectedLabelColor: UIColor = .white {
        didSet {
            setSelectedColors()
        }
    }
    
    var thumbColor: UIColor = .white {
        didSet {
            setSelectedColors()
        }
    }
        
    var animationDuration: Double = 0.3
    
    var selectedLabelFont: UIFont = .font(.nunitoBold, size: .medium)
    
    var unselectedLabelFont: UIFont = .font(.nunitoBold, size: .medium)
    
    var font: UIFont! = UIFont.systemFont(ofSize: 13) {
        didSet {
            setFont()
        }
    }
    
    public override var bounds: CGRect {
        didSet {
            layer.cornerRadius = frame.height / 2
        }
    }
    
    public convenience init(titles: [String],
                            selectedIndex: Int = 0,
                            selectedFont: UIFont = .font(.nunitoBold, size: .medium),
                            unselectedFont: UIFont = .font(.nunitoBold, size: .medium),
                            selectedTextColor: UIColor = .appRed,
                            unselectedTextColor: UIColor = .appCinder,
                            selectedColor: UIColor = .appRed,
                            backgroundColor: UIColor = .clear,
                            animationDuration: Double = 0.3) {
        defer {
            self.items = titles
            self.thumbColor = selectedColor
            self.unselectedLabelColor = unselectedTextColor
            self.selectedLabelColor = selectedTextColor
            self.backgroundColor = backgroundColor
            self.selectedIndex = selectedIndex
            self.selectedLabelFont = selectedFont
            self.unselectedLabelFont = unselectedFont
            self.font = unselectedLabelFont
            self.animationDuration = animationDuration
        }
        self.init()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
        setupView()
    }
    
    func setupView() {        
        backgroundColor = .appWhite
        
        setupLabels()
        
        addIndividualItemConstraints(labels, mainView: self, padding: 0)
        
        insertSubview(thumbView, at: 0)
    }
    
    func setupLabels() {
        
        for label in labels {
            label.removeFromSuperview()
        }
        
        labels.removeAll(keepingCapacity: true)
        
        if !items.isEmpty {
            for index in 1...items.count {
                
                let label = UILabel(frame: CGRect(x: 0, y: 0, width: 70, height: 40))
                label.text = items[index - 1]
                label.backgroundColor = UIColor.clear
                label.textAlignment = .center
                label.textColor = index == 1 ? selectedLabelColor : unselectedLabelColor
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = font
                
                self.addSubview(label)
                labels.append(label)
            }
        }
        
        addIndividualItemConstraints(labels, mainView: self, padding: 0)
    }
    
    func setupSeparators() {
        let separatorX = self.frame.width / CGFloat(items.count)
        for index in 0..<items.count where index != 0 {
            let view = UIViewBuilder().backgroundColor(.appZircon).build()
            self.insertSubview(view, at: 0)
            view.frame = .init(x: separatorX * CGFloat(index), y: 0, width: 2, height: self.frame.height)
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        thumbView.backgroundColor = thumbColor
        displayNewSelectedIndex()
        setupSeparators()
    }
    
    public override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let location = touch.location(in: self)
        
        var calculatedIndex: Int?
        for (index, item) in labels.enumerated() {
            if item.frame.contains(location) {
                calculatedIndex = index
            }
        }
        
        if calculatedIndex != nil {
            selectedIndex = calculatedIndex!
            sendActions(for: .valueChanged)
        }
        
        return false
    }
    
    func displayNewSelectedIndex() {
        for item in labels {
            item.textColor = unselectedLabelColor
            item.font = unselectedLabelFont
        }
        
        let label = labels[selectedIndex]
        label.textColor = selectedLabelColor
        label.font = selectedLabelFont
        
        UIView.animate(withDuration: animationDuration, delay: 0.0, animations: {
            let thumbX = (label.frame.width - 60) / 2 + label.frame.origin.x
            let thumbY = label.frame.height - 2 + label.frame.origin.y
            self.thumbView.frame = .init(x: thumbX, y: thumbY, width: 60, height: 2)
        }, completion: nil)
    }
    
    func addIndividualItemConstraints(_ items: [UIView],
                                      mainView: UIView,
                                      padding: CGFloat) {
        _ = mainView.constraints
        
        for (index, item) in items.enumerated() {
            
            let topConstraint = NSLayoutConstraint(item: item,
                                                   attribute: .top,
                                                   relatedBy: .equal,
                                                   toItem: mainView,
                                                   attribute: .top,
                                                   multiplier: 1.0,
                                                   constant: 0)
            
            let bottomConstraint = NSLayoutConstraint(item: item,
                                                      attribute: .bottom,
                                                      relatedBy: .equal,
                                                      toItem: mainView,
                                                      attribute: .bottom,
                                                      multiplier: 1.0,
                                                      constant: 0)
            
            var rightConstraint: NSLayoutConstraint!
            
            if index == items.count - 1 {
                
                rightConstraint = NSLayoutConstraint(item: item,
                                                     attribute: .right,
                                                     relatedBy: .equal,
                                                     toItem: mainView,
                                                     attribute: .right,
                                                     multiplier: 1.0,
                                                     constant: -padding)
                
            } else {
                
                let nextButton = items[index + 1]
                rightConstraint = NSLayoutConstraint(item: item,
                                                     attribute: .right,
                                                     relatedBy: .equal,
                                                     toItem: nextButton,
                                                     attribute: .left,
                                                     multiplier: 1.0,
                                                     constant: -padding)
            }
            
            var leftConstraint: NSLayoutConstraint!
            
            if index == 0 {
                
                leftConstraint = NSLayoutConstraint(item: item,
                                                    attribute: .left,
                                                    relatedBy: .equal,
                                                    toItem: mainView,
                                                    attribute: .left,
                                                    multiplier: 1.0,
                                                    constant: padding)
                
            } else {
                
                let prevButton = items[index - 1]
                leftConstraint = NSLayoutConstraint(item: item,
                                                    attribute: .left,
                                                    relatedBy: .equal,
                                                    toItem: prevButton,
                                                    attribute: .right,
                                                    multiplier: 1.0,
                                                    constant: padding)
                
                let firstItem = items[0]
                
                let widthConstraint = NSLayoutConstraint(item: item,
                                                         attribute: .width,
                                                         relatedBy: .equal,
                                                         toItem: firstItem,
                                                         attribute: .width,
                                                         multiplier: 1.0,
                                                         constant: 0)
                
                mainView.addConstraint(widthConstraint)
            }
            
            mainView.addConstraints([topConstraint,
                                     bottomConstraint,
                                     rightConstraint,
                                     leftConstraint])
        }
    }
    
    func setSelectedColors() {
        for item in labels {
            item.textColor = unselectedLabelColor
            item.font = unselectedLabelFont
        }
        
        if !labels.isEmpty {
            labels[0].textColor = selectedLabelColor
            labels[0].font = selectedLabelFont
        }
        
        thumbView.backgroundColor = thumbColor
    }
    
    func setFont() {
        for item in labels {
            item.font = font
        }
    }
}
