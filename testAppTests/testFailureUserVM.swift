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
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetListIDs() throws {
        let promise = expectation(description: "Failure")
        
        userViewModel.getUsersIDs()
        
        _ = userViewModel.$ids.sink { (ids) in
            promise.fulfill()
        }
        
        _ = userViewModel.errorSubject.sink { (isError) in
            XCTAssertTrue(isError)
        }
        
        wait(for: [promise], timeout: 1)
        
        XCTAssertEqual(userViewModel.ids.count, 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

