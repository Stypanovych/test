//
//  SuccussMockAPI.swift
//  testAppTests
//
//  Created by Kolya Stypanovych on 16.08.2020.
//

import XCTest
@testable import testApp


class SuccussMockAPI: APIProtocol {
    func getUsersIDs(completion: @escaping (Result<UserDataIDs, Error>) -> Void) {
        completion(Result.success(UserDataIDs(status: "succuss", data: ["1", "2", "3"])))
    }
    
    func getUserProfile(with id: String, completion: @escaping (Result<UserData, Error>) -> Void) {
        completion(Result.success(UserData(status: "succuss", data: User(id: id, firstName: "firstName", lastName: "lastName", age: 1, gender: "gender", country: "country"))))
    }
}
