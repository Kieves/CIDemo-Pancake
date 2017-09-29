//
//  StackReviewUITests.swift
//  StackReviewUITests
//
//  Created by Hernandez, Rodolfo on 9/27/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import XCTest

class StackReviewUITests: XCTestCase {

    var app: XCUIApplication!
    
    var horizontalSizeClass: XCUIUserInterfaceSizeClass {
        return app.windows.element(boundBy: 0).horizontalSizeClass
    }
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testCanNavigateToAboutScreen(){
        
        if horizontalSizeClass != .regular{
            let pancakeHouseButton = app.navigationBars.buttons["Pancake Houses"]
            pancakeHouseButton.tap()
        }
        
        let aboutButton = app.navigationBars.buttons["About"]
        aboutButton.tap()
        
        let aboutTitleText = app.navigationBars["About"]
        XCTAssertTrue(aboutTitleText.exists, "Should be on the about screen")
    }
    
    func testCanNavigateToPancakeDetails(){
        if horizontalSizeClass != .regular{
            let pancakeHouseButton = app.navigationBars.buttons["Pancake Houses"]
            pancakeHouseButton.tap()
        }
        
        let tableText = app.tables.staticTexts["Crêpe Delight"]
        tableText.tap()
        
        let pancakeTitleText = app.staticTexts["Crêpe Delight"]
        let pancakeMap = app.maps.element
        
        XCTAssertTrue(pancakeMap.exists, "The map should be on screen")
        XCTAssertTrue(pancakeTitleText.exists, "The correct title text should be on screen")
    }
    
//    func testPancakeHouseScreenHasScrollView(){
//        app.navigationBars["Master"].buttons["Pancake Houses"].tap()
//
//        let tablesQuery = app.tables
//        tablesQuery/*@START_MENU_TOKEN@*/.cells["Maison des Crêpes"].staticTexts["Maison des Crêpes"]/*[[".cells[\"Maison des Crêpes\"].staticTexts[\"Maison des Crêpes\"]",".staticTexts[\"Maison des Crêpes\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.swipeUp()
//        tablesQuery/*@START_MENU_TOKEN@*/.cells["Ye Olde Pancake"].staticTexts["Ye Olde Pancake"]/*[[".cells[\"Ye Olde Pancake\"].staticTexts[\"Ye Olde Pancake\"]",".staticTexts[\"Ye Olde Pancake\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
//
//        XCTAssertEqual(app.scrollViews.count, 1)
//    }
//
    func testShowAndHideRWLogo(){
        
        let app = XCUIApplication()
        app.navigationBars["Master"].buttons["Pancake Houses"].tap()
        app.navigationBars.buttons["About"].tap()
        
        let showHideCopyrightNoticeButton = app.buttons["Show/Hide Copyright Notice"]
        showHideCopyrightNoticeButton.tap()
        XCTAssertTrue(app.images["rw_logo"].exists)
        showHideCopyrightNoticeButton.tap()
        XCTAssertFalse(app.images["rw_logo"].exists)
    }
}
