//
//  PancakeHouseCollectionIntegrationTests.swift
//  StackReviewIntegrationTests
//
//  Created by Hernandez, Rodolfo on 9/26/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import XCTest
@testable import StackReview

class PancakeHouseCollectionIntegrationTests: XCTestCase {
    
    var collection: PancakeHouseCollection!
    override func setUp(){
        super.setUp()
        collection = PancakeHouseCollection()
    }
    
    func testLoadPancakesFromCloudFails(){
        //given
        let expectation = self.expectation(description: "Expected load pancakes from cloud to fail")
        //when
        collection.loadPancakesFromCloud {(didReceiveData) in
            expectation.fulfill()
            XCTAssertFalse(didReceiveData)
        }
        //then
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testMockClouldService(){
        let mockCloudNetworkService = MockCloudNetworkManager()
        collection._cloudNetworkManager = mockCloudNetworkService
        
        let expectation = self.expectation(description: "Expected load pancakes from cloud to succeed")
        
        collection.loadPancakesFromCloud{(didReceiveData) in
            expectation.fulfill()
            XCTAssertTrue(didReceiveData)
            XCTAssertEqual(self.collection._pancakeHouses, mockCloudNetworkService.pancakeHouses)
        }
        
        waitForExpectations(timeout: 0.1, handler: nil)
    }    
}
