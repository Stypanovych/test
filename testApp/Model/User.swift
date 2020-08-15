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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(String.self, forKey: .status)
        data = try? container.decode(User.self, forKey: .data)
    }
}

struct User: Codable, Identifiable {
    let id: String
    let firstName: String
    let lastName: String
    
    let age: Int
    
    let gender: String
    let country: String
    
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        id = try container.decode(String.self, forKey: .id)
//        firstName = try container.decode(String.self, forKey: .firstName)
//        lastName = try container.decode(String.self, forKey: .lastName)
//        age = try container.decode(Int.self, forKey: .age)
//        gender = try container.decode(String.self, forKey: .gender)
//        country = try container.decode(String.self, forKey: .country)
//    }
}
