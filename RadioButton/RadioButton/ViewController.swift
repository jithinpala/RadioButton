//
//  ViewController.swift
//  RadioButton
//
//  Created by Jithin Balan on 14/4/20.
//  Copyright © 2020 Jithin Balan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RadioGroupDelegate {
    
    @IBOutlet private weak var firstButton: RadioButton! 
    @IBOutlet private weak var secondButton: RadioButton!
    @IBOutlet private weak var thirdButton: RadioButton!
    
    @IBOutlet private weak var businessButton: RadioButton!
    @IBOutlet private weak var touristButton: RadioButton!
    
    private var itemGroup: RadioGroup?
    private var travelTypGruop: RadioGroup?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        itemGroup = RadioGroup(buttons: [firstButton, secondButton, thirdButton], groupId: "Item")
        itemGroup?.delegate = self
        
        travelTypGruop = RadioGroup(buttons: [businessButton, touristButton], groupId: "TravelType")
        travelTypGruop?.delegate = self
        
    }
    
    func didSelectedButtonWith(_ index: Int?, value: String?, groupId: String?) {
        print("\n ====>  Index => \(index), selected value => \(value), groupId => \(groupId)")
    }
    
}

