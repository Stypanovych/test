//
//  APIProtocol.swift
//  testApp
//
//  Created by Kolya Stypanovych on 14.08.2020.
//

import Foundation
import Alamofire


protocol APIProtocol {
    func getPeopleID(token: String,
                     completion: @escaping (Result<UserDataIDs, APIError>) -> Void) -> DataRequest
    
    func getPeople(token: String,
                   id: String,
                   completion: @escaping (Result<UserData, APIError>) -> Void) -> DataRequest
}
