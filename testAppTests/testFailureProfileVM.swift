//
//  testFailureProfileVM.swift
//  testAppTests
//
//  Created by Kolya Stypanovych on 16.08.2020.
//


import XCTest
import Combine
@testable import testApp

class testFailureProfileVM: XCTestCase {

    var profileViewModel: ProfileViewModel!
    
    override func setUpWithError() throws {
        profileViewModel = ProfileViewModel(userId: "1", api: FailureMockAPI())
        
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetListIDs() throws {
        let promise = expectation(description: "Succuss")
        
        profileViewModel.getUserProfile(id: "1")
        
        _ = profileViewModel.$user.sink { (user) in
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: 1)
        
        XCTAssertNil(profileViewModel.user)
        _ = profileViewModel.errorSubject.sink { (isError) in
            XCTAssertTrue(isError)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
