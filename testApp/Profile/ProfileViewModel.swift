//
//  ProfileViewModel.swift
//  testApp
//
//  Created by Kolya Stypanovych on 14.08.2020.
//

import SwiftUI


class ProfileViewModel: ObservableObject {
    
    var user: User
    
    init(user: User) {
        self.user = user
    }
}
