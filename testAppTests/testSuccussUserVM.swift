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
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}


