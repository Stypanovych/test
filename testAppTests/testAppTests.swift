//
//  testAppTests.swift
//  testAppTests
//
//  Created by Kolya Stypanovych on 13.08.2020.
//

import XCTest
import Alamofire
@testable import testApp

class testAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}


//class MockAPI: APIProtocol {
//    func getPeopleID(token: String, completion: @escaping (AFResult<UserDataID>) -> Void) -> DataRequest {
//        
//    }
//    
//    func getPeople(token: String, id: String, completion: @escaping (AFResult<UserData>) -> Void) -> DataRequest {
//        
//    }
//
////}
