//
//  failureTest.swift
//  testAppTests
//
//  Created by Kolya Stypanovych on 16.08.2020.
//


import XCTest
import Combine
@testable import testApp

class testFailureUserVM: XCTestCase {
    
    var userViewModel: UsersViewModel!
    
    override func setUpWithError() throws {
        userViewModel = UsersViewModel(api: FailureMockAPI())
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        userViewModel = nil
    }
    
    func testGetListIDs() throws {
        let promise = expectation(description: "Failure")
        
        userViewModel.getUsersIDs()
        
        _ = userViewModel.$ids.sink { (ids) in
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: 1)
        
        XCTAssertEqual(userViewModel.ids.count, 0)
    }
}

