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
        firstItemButton.isSelected = true
        
        let itemGroup = RadioGroupController()
        itemGroup.addButtons([firstItemButton, secondItemButton, thirdItemButton], groupId: "ItemType")
        XCTAssertEqual(itemGroup.selectedIndex, 0, "Selected index is wrong")
        XCTAssertEqual(itemGroup.selectedGroupId, "ItemType", "Selected group id is wrong")
    }
    
    func testRadioGroupWithMultipleButtons_WhereSecondButtonIsSelected() {
        secondItemButton.isSelected = true
        
        let itemGroup = RadioGroupController()
        itemGroup.addButtons([firstItemButton, secondItemButton, thirdItemButton], groupId: "ItemType")
        XCTAssertEqual(itemGroup.selectedIndex, 1, "Selected index is wrong")
        XCTAssertEqual(itemGroup.selectedGroupId, "ItemType", "Selected group id is wrong")
    }
    
    func testRadioGroupWithMultipleButtons_WhereNoButtonsAreSelected() {
        let itemGroup = RadioGroupController()
        itemGroup.addButtons([firstItemButton, secondItemButton, thirdItemButton], groupId: "ItemType")
        XCTAssertEqual(itemGroup.selectedGroupId, "ItemType", "Selected group id is wrong")
        XCTAssertNil(itemGroup.selectedIndex, "Selected index should be nil")
    }

}
