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
            getView(with: "firstname_title".localized,
                    value: self.viewModel.user?.firstName)
            getView(with: "lastname_title".localized,
                    value: self.viewModel.user?.lastName)
            getView(with: "age_title".localized,
                    value: "\(self.viewModel.user?.age)")
            getView(with: "gender_title".localized,
                    value: self.viewModel.user?.gender)
            getView(with: "country_title".localized,
                    value: self.viewModel.user?.country)
        }
    }
    
    func getView(with title: String, value: String?) -> AnyView {
        return
            AnyView(
                GeometryReader { geometry in
                    HStack {
                        Text(title)
                        Text(value ?? "error")
                    }
                    .frame(minWidth: geometry.frame(in: .global).size.width,
                           minHeight: 20)
                }
        )
    }
}

