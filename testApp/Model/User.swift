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
