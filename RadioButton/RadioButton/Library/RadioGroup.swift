//
//  RadioGroup.swift
//  RadioButton
//
//  Created by Jithin Balan on 14/4/20.
//  Copyright © 2020 Jithin Balan. All rights reserved.
//


import Foundation

protocol RadioGroupDelegate: class {
    func didSelectedButtonWith(_ index: Int?, value: String?, groupId: String?)
}

class RadioGroup : NSObject, RadioButtonDelegate {
    
    private var buttons = [RadioButton]()
    weak var delegate : RadioGroupDelegate? = nil
    var isGroupSelectionEnabled = false
    private var groupId: String?
    
    override init() {
        super.init()
    }

    init(buttons: [RadioButton],
         groupId: String? = nil,
         isMultipleSelectionEnabled: Bool? = nil) {
        super.init()
        self.groupId = groupId
        for radioButton in buttons {
            radioButton.delegate = self
            radioButton.otherButtons = buttons.filter { $0 != radioButton }
            
            if let isMultipleSelectionEnabled = isMultipleSelectionEnabled {
                radioButton.isMultipleSelectionEnabled = isMultipleSelectionEnabled
            }
        }
        self.buttons = buttons
    }
    
    func addButton(_ button: RadioButton,
                   groupId: String? = nil,
                   isMultipleSelectionEnabled: Bool? = nil) {
        self.groupId = groupId
        if let isMultipleSelectionEnabled = isMultipleSelectionEnabled {
            button.isMultipleSelectionEnabled = isMultipleSelectionEnabled
        }
        button.delegate = self
        buttons.append(button)
    }
    
    func removeButton(_ button: RadioButton) {
        button.otherButtons = []
        buttons.first { $0 == button }?.isSelected = false
        buttons.removeAll(where: { $0 == button })
        buttons.forEach {
            $0.otherButtons.removeAll(where: { $0 == button})
        }
    }
    
    func addButtons(_ buttons: [RadioButton],
                         groupId: String? = nil,
                         isMultipleSelectionEnabled: Bool? = nil) {
        for radioButton in buttons {
            radioButton.delegate = self
            if let isMultipleSelectionEnabled = isMultipleSelectionEnabled {
                radioButton.isMultipleSelectionEnabled = isMultipleSelectionEnabled
            }
        }
        self.groupId = groupId
        self.buttons = buttons
    }
    
    var selectedButton: RadioButton? {
        guard let index = buttons.firstIndex(where: { button in button.isSelected }) else { return nil }
        return buttons[index]
    }
    
    var selectedIndex: Int? {
        guard let index = buttons.firstIndex(where: { button in button.isSelected }) else { return nil }
        return index
    }
    
    var selectedValue: String? {
        guard let index = buttons.firstIndex(where: { button in button.isSelected }) else { return nil }
        return buttons[index].identifier
    }
    
    var selectedGroupId: String? {
        return groupId
    }
    
    func didSelectedButton(_ button: RadioButton) {
        delegate?.didSelectedButtonWith(selectedIndex, value: selectedValue, groupId: selectedGroupId)
    }

}
