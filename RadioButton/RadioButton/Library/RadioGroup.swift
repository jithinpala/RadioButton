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

    func addButtons(_ radioButtons: [RadioButtonProtocol]) {
        buttons.removeAll()
        radioButtons.forEach { button in
            if buttons.contains(where: { $0.identifier == button.identifier }) {
                assertionFailure("Radio button should have unique identifier")
            }
            buttons.append(button)
        }
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
        guard !(isRadioButtonSelected(for: identifier)) else { return }
        var selectedButton: RadioButtonProtocol?
        buttons.forEach {
            let radioButton = $0 as? RadioButton
            let isSelected = radioButton?.identifier == identifier
            radioButton?.isSelected = isSelected
            if isSelected {
                selectedButton = radioButton
            }
        }
        if let selectedButton = selectedButton {
            delegate?.didSelectButton(selectedButton)
        }
    }
    
    private func isRadioButtonSelected(for identifier: String?) -> Bool {
        guard let previousSelectedButton = buttons.first(where: { $0.isSelected }) else { return false }
        return previousSelectedButton.identifier == identifier
    }

}
