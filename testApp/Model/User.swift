//
//  User.swift
//  testApp
//
//  Created by Kolya Stypanovych on 13.08.2020.
//

import Foundation


struct User: Codable, Hashable {
    let firstName: String
    let lastName: String
    
    let age: Int
    
    let gender: String
    let country: String
}
