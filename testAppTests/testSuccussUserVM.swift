//
//  testAppTests.swift
//  testAppTests
//
//  Created by Kolya Stypanovych on 13.08.2020.
//

import XCTest
import Combine
@testable import testApp

class testSuccussUserVM: XCTestCase {
    
    var userViewModel: UsersViewModel!
    
    override func setUpWithError() throws {
        userViewModel = UsersViewModel(api: SuccussMockAPI())
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        userViewModel = nil
    }
    
    func testGetListIDs() throws {
        let promise = expectation(description: "Succuss")
        
        userViewModel.getUsersIDs()
        
        _ = userViewModel.$ids.sink { (ids) in
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: 1)
        
        XCTAssertEqual(userViewModel.ids.count, 3)
        XCTAssertEqual(userViewModel.ids.first, "1")
    }
}


