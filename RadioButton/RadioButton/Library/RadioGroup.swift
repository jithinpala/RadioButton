//
//  RadioGroup.swift
//  RadioButton
//
//  Created by Jithin Balan on 14/4/20.
//  Copyright © 2020 Jithin Balan. All rights reserved.
//


import Foundation

protocol RadioGroupDelegate: class {
    func didSelectButton(_ button: RadioButtonProtocol?)
}

protocol RadioButtonProtocol {
    var identifier: String? { get }
    var title: String? { get }
    var isSelected: Bool { get set }
}

class RadioGroup : NSObject, RadioButtonDelegate {
    
    weak var delegate : RadioGroupDelegate? = nil
    private var buttons = [RadioButtonProtocol]()
    
    override init() {
        super.init()
    }

    func addButtons(_ buttons: [RadioButtonProtocol]) {
        self.buttons = buttons
    }
    
    var selectedIndex: Int? {
        return buttons.firstIndex(where: { $0.isSelected })
    }
    
    var selectedIdentifier: String? {
        return buttons.first(where: { $0.isSelected })?.identifier
    }
    
    var selectedTitle: String? {
        return buttons.first(where: { $0.isSelected })?.title
    }
    
    func didSelectButton(_ identifier: String?) {
        buttons.forEach {
            let selectedButton = $0 as? RadioButton
            selectedButton?.isSelected = selectedButton?.identifier == identifier
        }
        delegate?.didSelectButton(buttons.first(where: { $0.identifier == identifier }))
    }

}