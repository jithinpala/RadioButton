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
    
    private var groupController: RadioGroup?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        groupController = RadioGroup(buttons: [firstButton, secondButton, thirdButton])
        groupController?.delegate = self
        
    }

    func didSelectedButton(_ index: Int?, value: String?) {
        print("Index => \(index), selected value => \(value)")
    }

}

