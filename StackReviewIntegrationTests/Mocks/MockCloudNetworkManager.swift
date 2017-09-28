//
//  MockCloudNetworkManager.swift
//  StackReviewIntegrationTests
//
//  Created by Hernandez, Rodolfo on 9/27/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import Foundation
@testable import StackReview

public class MockCloudNetworkManager : CloudNetworkService {
    public lazy var pancakeHouses: [PancakeHouse] = {
        let bundle = Bundle(for: type(of:self))
        let path = bundle.path(forResource: "test_pancake_houses", ofType: "plist")!
        let array = NSArray(contentsOfFile: path) as! [[String:Any]]

        return PancakeHouse.from(array)
    }()
    
    public func login(userName: String, password: String, success: () -> (), failure: (Error) -> ()) {
        success()
    }
    
    public func loadPancakeHouses(success: @escaping ([PancakeHouse]) -> (), failure: @escaping (CloudNetworkError) -> ()) {
        
        success(pancakeHouses)
    }
}
