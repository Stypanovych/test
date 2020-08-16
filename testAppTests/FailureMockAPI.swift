//
//  FailureMockAPI.swift
//  testAppTests
//
//  Created by Kolya Stypanovych on 16.08.2020.
//

import XCTest
@testable import testApp


enum APIError: Error {
    case userIDError
    case userDataError
}

class FailureMockAPI: APIProtocol {
    func getUsersIDs(completion: @escaping (Result<UserDataIDs, Error>) -> Void) {
        completion(Result.failure(APIError.userIDError))
    }
    
    func getUserProfile(with id: String, completion: @escaping (Result<UserData, Error>) -> Void) {
        completion(Result.failure(APIError.userDataError))
    }
}
