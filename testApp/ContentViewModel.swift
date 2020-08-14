//
//  ContentViewModel.swift
//  testApp
//
//  Created by Kolya Stypanovych on 13.08.2020.
//

import SwiftUI


class ContentViewModel: ObservableObject {
    
    var users = [User]()
    
    init() {
        guard let token = JWTCreator.shared.getJWTToken() else { return }
        _ = API.shared.getPeopleID(token: token) { (user) in
            do {
                print(try user.get().data.first)
            } catch {
                print("error of getting list")
            }
        }

    }
}

