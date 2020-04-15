//
//  RadioButton.swift
//  RadioButton
//
//  Created by Jithin Balan on 14/4/20.
//  Copyright © 2020 Jithin Balan. All rights reserved.
//

import Foundation
import UIKit

protocol RadioButtonDelegate: class {
    func didSelectedButton(_ button: RadioButton)
}

@IBDesignable
class RadioButton: UIButton {
    
    private var circleLayer = CAShapeLayer()
    private var fillCircleLayer = CAShapeLayer()
    
    var identifier: String?
    var isMultiSelectionEnabled: Bool = false
    weak var delegate: RadioButtonDelegate?
    @IBOutlet var otherButtons: [UIButton]!
    
    @IBInspectable var defaultColor: UIColor = UIColor.black {
        didSet {
            circleLayer.strokeColor = defaultColor.cgColor
            self.toggleButon()
        }
    }
    
    @IBInspectable var highlightedColor: UIColor = UIColor.blue {
        didSet {
            circleLayer.strokeColor = highlightedColor.cgColor
            self.toggleButon()
        }
    }
    
    @IBInspectable var titleLeftSpace: CGFloat = 30 {
        didSet {
            self.contentEdgeInsets = UIEdgeInsets(top: 0, left: titleLeftSpace, bottom: 0, right: 0)
        }
    }
    
    @IBInspectable var circleRadius: CGFloat = 10.0
    @IBInspectable var circleLineWidth: CGFloat = 1
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        identifier = currentTitle
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        identifier = currentTitle
        initialize()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleLayer.frame = bounds
        circleLayer.path = circlePath().cgPath
        fillCircleLayer.frame = bounds
        fillCircleLayer.path = fillCirclePath().cgPath
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: titleLeftSpace, bottom: 0, right: 0)
    }
    
    override func prepareForInterfaceBuilder() {
        initialize()
    }
    
    override var isSelected: Bool {
        didSet {
            toggleButon()
        }
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        identifier = currentTitle
    }
    
    private func initialize() {
        circleLayer.frame = bounds
        circleLayer.lineWidth = circleLineWidth
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = defaultColor.cgColor
        layer.addSublayer(circleLayer)
        fillCircleLayer.frame = bounds
        fillCircleLayer.lineWidth = 0
        fillCircleLayer.fillColor = UIColor.clear.cgColor
        fillCircleLayer.strokeColor = UIColor.clear.cgColor
        layer.addSublayer(fillCircleLayer)
        self.contentVerticalAlignment = .center
        self.contentHorizontalAlignment = .leading
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: titleLeftSpace, bottom: 0, right: 0)
        self.toggleButon()
        self.initRadioButtonAction()
        
    }
    
    private func circleFrame() -> CGRect {
        var circleFrame = CGRect(x: 0, y: 0, width: 2*circleRadius, height: 2*circleRadius)
        circleFrame.origin.x = 0 + circleLayer.lineWidth
        circleFrame.origin.y = bounds.height/2 - circleFrame.height/2
        return circleFrame
    }
    
    private func toggleButon() {
        if self.isSelected {
            fillCircleLayer.fillColor = highlightedColor.cgColor
            circleLayer.strokeColor = highlightedColor.cgColor
        } else {
            fillCircleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.strokeColor = defaultColor.cgColor
        }
    }
    
    private func circlePath() -> UIBezierPath {
        return UIBezierPath(ovalIn: circleFrame())
    }
    
    private func fillCirclePath() -> UIBezierPath {
        return UIBezierPath(ovalIn: circleFrame().insetBy(dx: 4, dy: 4))
    }
    
    func initRadioButtonAction() {
        self.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }
    
    @objc func touchUpInside() {
        if isMultiSelectionEnabled {
            self.isSelected = !self.isSelected
            deSelectButtons()
        } else {
            self.isSelected = true
            deSelectButtons()
        }
        delegate?.didSelectedButton(self)
    }
    
    func deSelectButtons() {
        guard let otherButtons = otherButtons else { return }
        otherButtons.forEach { $0.isSelected = false }
    }
}

