//
//  RadioButtonTests.swift
//  RadioButtonTests
//
//  Created by Jithin Balan on 15/4/20.
//  Copyright © 2020 Jithin Balan. All rights reserved.
//

import XCTest
@testable import RadioButton

class RadioButtonTests: XCTestCase {

    let firstItemButton = RadioButton()
    let secondItemButton = RadioButton()
    let thirdItemButton = RadioButton()

    func testRadioGroupWithMultipleButtons_WhereFirstButtonIsSelected() {
        firstItemButton.identifier = "first"
        
        let itemGroup = RadioGroup()
        itemGroup.addButtons([firstItemButton, secondItemButton, thirdItemButton])
        itemGroup.didSelectButton("first")
        XCTAssertEqual(itemGroup.selectedIndex, 0, "Selected index is wrong")
        XCTAssertEqual(itemGroup.selectedIdentifier, "first", "Selected group id is wrong")
    }
    
    func testRadioGroupWithMultipleButtons_WhereSecondButtonIsSelected() {
        secondItemButton.identifier = "second"
        
        let itemGroup = RadioGroup()
        itemGroup.addButtons([firstItemButton, secondItemButton, thirdItemButton])
        itemGroup.didSelectButton("second")
        XCTAssertEqual(itemGroup.selectedIndex, 1, "Selected index is wrong")
        XCTAssertEqual(itemGroup.selectedIdentifier, "second", "Selected group id is wrong")
    }
    
    func testRadioGroupWithMultipleButtons_WhereNoButtonsAreSelected() {
        let itemGroup = RadioGroup()
        itemGroup.addButtons([firstItemButton, secondItemButton, thirdItemButton])
        XCTAssertNil(itemGroup.selectedIdentifier, "SSelected identifier should be nil")
        XCTAssertNil(itemGroup.selectedIndex, "Selected index should be nil")
    }

}
