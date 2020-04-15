//
//  ViewController.swift
//  RadioButton
//
//  Created by Jithin Balan on 14/4/20.
//  Copyright © 2020 Jithin Balan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RadioGroupDelegate {
    
    @IBOutlet private weak var firstButton: RadioButton! {
        didSet {
            firstButton.identifier = "First"
            firstButton.title = "First Demo"
            firstButton.delegate = itemGroup
        }
    }
    @IBOutlet private weak var secondButton: RadioButton! {
        didSet {
            secondButton.identifier = "Second"
            secondButton.title = "Second Demo"
            secondButton.delegate = itemGroup
        }
    }
    @IBOutlet private weak var thirdButton: RadioButton! {
        didSet {
            thirdButton.identifier = "Third"
            thirdButton.title = "Third Demo"
            thirdButton.delegate = itemGroup
        }
    }
    
    @IBOutlet private weak var businessButton: RadioButton!
    @IBOutlet private weak var touristButton: RadioButton!
    
    private var itemGroup = RadioGroup()
    private var travelTypGruop: RadioGroup?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemGroup.addButtons([firstButton, secondButton, thirdButton])
        itemGroup.delegate = self
        
    }
    
    func didSelectButton(_ button: RadioButtonProtocol?) {
        print(button)
    }
    
    @IBAction func demo(_ sender: UIButton) {
        print("====> \(itemGroup.selectedIndex), ====> \(itemGroup.selectedTitle), =====> \(itemGroup.selectedIdentifier)")
    }
}

