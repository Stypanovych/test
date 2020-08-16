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
        profileViewModel = nil
    }
    
    func testGetListIDs() throws {
        let promise = expectation(description: "Succuss")
        
        profileViewModel.getUserProfile(id: "1")
        
        _ = profileViewModel.$user.sink { (user) in
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: 1)
        
        XCTAssertNil(profileViewModel.user)
    }
}
