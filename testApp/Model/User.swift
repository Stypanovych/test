//
//  User.swift
//  testApp
//
//  Created by Kolya Stypanovych on 13.08.2020.
//

import Foundation

struct UserDataIDs: Codable {
    let status: String
    let data: [String]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(String.self, forKey: .status)
        data = try container.decode([String].self, forKey: .data).map {
            return String($0)
        }
    }
}

struct UserData: Codable {
    let status: String
    let data: User?
}

struct User: Codable, Identifiable {
    let id: String
    let firstName: String
    let lastName: String
    
    let age: Int
    
    let gender: String
    let country: String
}
