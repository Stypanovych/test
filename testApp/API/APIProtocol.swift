//
//  APIProtocol.swift
//  testApp
//
//  Created by Kolya Stypanovych on 14.08.2020.
//

import Foundation
import Alamofire


protocol APIProtocol {
    func getUsersIDs(completion: @escaping (Result<UserDataIDs, Error>) -> Void)
    
    func getUserProfile(with id: String,
                        completion: @escaping (Result<UserData, Error>) -> Void)
}
