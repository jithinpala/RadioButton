//
//  RadioGroup.swift
//  RadioButton
//
//  Created by Jithin Balan on 14/4/20.
//  Copyright © 2020 Jithin Balan. All rights reserved.
//


import Foundation
import UIKit

protocol RadioGroupDelegate: class {
    func didSelectedButton(_ index: Int?, value: String?)
}

class RadioGroup : NSObject {
    private var buttons = [RadioButton]()
    weak var delegate : RadioGroupDelegate? = nil
    var isGroupSelectionEnabled = false
    
    override init() {
        super.init()
    }

    init(buttons: [RadioButton]) {
        super.init()
        for aButton in buttons {
            aButton.addTarget(self, action: #selector(radioButtonTapAction(_:)), for: .touchUpInside)
        }
        self.buttons = buttons
    }
    
    func addButton(_ button: RadioButton) {
        buttons.append(button)
        button.addTarget(self, action: #selector(radioButtonTapAction(_:)), for: .touchUpInside)
    }
    
    func removeButton(_ button: RadioButton) {
        var iteratingButton: RadioButton? = nil
        if(buttons.contains(button))
        {
            iteratingButton = button
        }
        if(iteratingButton != nil) {
            buttons.remove(at: buttons.firstIndex(of: iteratingButton!)!)
            iteratingButton!.removeTarget(self, action: #selector(radioButtonTapAction(_:)), for: .touchUpInside)
            iteratingButton!.isSelected = false
        }
    }
    
    func setButtonsArray(_ buttons: [RadioButton]) {
        for button in buttons {
            button.addTarget(self, action: #selector(radioButtonTapAction(_:)), for: .touchUpInside)
        }
        self.buttons = buttons
    }

    @objc func radioButtonTapAction(_ sender: UIButton) {
        if(sender.isSelected) {
            sender.isSelected = false
        } else {
            for button in buttons {
                button.isSelected = false
            }
            sender.isSelected = true
        }
        guard sender.isSelected else { return }
        delegate?.didSelectedButton(selectedIndex, value: selectedValue)
    }
    
    var selectedButton: UIButton? {
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

}
