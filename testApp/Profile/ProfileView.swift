//
//  ProfileView.swift
//  testApp
//
//  Created by Kolya Stypanovych on 14.08.2020.
//

import SwiftUI


struct ProfileView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("First Name")
                Text(viewModel.user.firstName)
            }
            HStack {
                Text("Last Name")
                Text(viewModel.user.lastName)
            }
            HStack {
                Text("Age")
                Text("\(viewModel.user.age)")
            }
            HStack {
                Text("Gender")
                Text(viewModel.user.gender)
            }
            HStack {
                Text("Country")
                Text(viewModel.user.country)
            }
        }
    }
}

