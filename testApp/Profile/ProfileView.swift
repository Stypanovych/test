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
                    Text("firstname_title".localized)
                    Text(self.viewModel.user.firstName)
                }
                .frame(minWidth: geometry.frame(in: .global).size.width,
                       minHeight: 30)
                HStack {
                    Text("lastname_title".localized)
                    Text(self.viewModel.user.lastName)
                }
                .frame(minWidth: geometry.frame(in: .global).size.width,
                       minHeight: 30)
                HStack {
                    Text("age_title".localized)
                    Text("\(self.viewModel.user.age)")
                }
                .frame(minWidth: geometry.frame(in: .global).size.width,
                       minHeight: 30)
                HStack {
                    Text("gender_title".localized)
                    Text(self.viewModel.user.gender)
                }
                .frame(minWidth: geometry.frame(in: .global).size.width,
                       minHeight: 30)
                HStack {
                    Text("country_title".localized)
                    Text(self.viewModel.user.country)
                }
                .frame(minWidth: geometry.frame(in: .global).size.width,
                       minHeight: 30)
            }
        }
    }
}

