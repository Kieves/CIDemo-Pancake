//
//  PancakeHouseCollectionTests.swift
//  StackReviewTests
//
//  Created by Hernandez, Rodolfo on 9/26/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import XCTest

@testable import StackReview

class PancakeHouseCollectionTests: XCTestCase {
    var collection: PancakeHouseCollection!
    override func setUp() {
        super.setUp()
        collection = PancakeHouseCollection()
        
        let bundle = Bundle(for: PancakeHouseCollectionTests.self)
        collection.loadPancakeHouses("test_pancake_houses", in: bundle)
    }
    
    func testCollectionHasExpectedItemsCount(){
        XCTAssert(collection.count == 3, "Collection didn't have expected number of items")
    }
    
    func testFirstPancakeHouseSelectedValues(){
        verifyPancakeHouseHasExpectedValues(index: 0)
    }
    
    func testAddingNewPancakeHouse(){
        let dict: [String:Any] = ["name" : "Test Pancake House",
                                  "priceGuide" : 1,
                                  "rating" : 1,
                                  "details" : "Test"]
        
        if let pck = PancakeHouse(dictionary: dict){
            collection.addPancakeHouse(pck)
            XCTAssertTrue(collection._pancakeHouses.contains(pck))
        } else {
            XCTFail("Pancake House could not be added")
        }
    }
    
    func testRemovingPancakeHouse(){
        let pancakeToRemove = collection[0]
        try! collection.removePancakeHouse(pancakeToRemove)
        XCTAssertFalse(collection._pancakeHouses.contains(pancakeToRemove))
    }
    
    func verifyPancakeHouseHasExpectedValues(index: Int){
        let plistIndex = index+1
        
        let pancakeHouse = collection[index]
        XCTAssertEqual(pancakeHouse.name, "name \(plistIndex)")
        XCTAssertEqual(pancakeHouse.details, "details \(plistIndex)")
        XCTAssertEqual(pancakeHouse.photo, UIImage(named:"pancake\(plistIndex)"))
    }
    
    func testMeasureLoadDefaultPancakeHouse(){
        measure{
            self.collection.loadDefaultPancakeHouses()
        }
    }
    
    func testMarkingPancakeAsFavorite(){
        let myPank = collection[0]
        XCTAssertFalse(collection.isFavorite(myPank))
        collection.favorite = myPank
        XCTAssertTrue(collection.isFavorite(myPank))
    }
    
    func testFavoritePancakeFail(){
        let dict: [String : Any] = ["name": "Test Pancake House",
                                          "priceGuide": 1,
                                          "rating": 1,
                                          "details": "Test"]
        let testPank = PancakeHouse(dictionary: dict)!
        collection.favorite = testPank
        XCTAssertNil(collection.favorite)
    }
}
