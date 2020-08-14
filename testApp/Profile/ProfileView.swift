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
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text("First Name")
                    Text(self.viewModel.user.firstName)
                }
                .frame(minWidth: geometry.frame(in: .global).size.width,
                       minHeight: 30)
                HStack {
                    Text("Last Name")
                    Text(self.viewModel.user.lastName)
                }
                .frame(minWidth: geometry.frame(in: .global).size.width,
                       minHeight: 30)
                HStack {
                    Text("Age")
                    Text("\(self.viewModel.user.age)")
                }
                .frame(minWidth: geometry.frame(in: .global).size.width,
                       minHeight: 30)
                HStack {
                    Text("Gender")
                    Text(self.viewModel.user.gender)
                }
                .frame(minWidth: geometry.frame(in: .global).size.width,
                       minHeight: 30)
                HStack {
                    Text("Country")
                    Text(self.viewModel.user.country)
                }
                .frame(minWidth: geometry.frame(in: .global).size.width,
                       minHeight: 30)
            }
        }
    }
}

