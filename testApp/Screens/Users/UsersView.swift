//
//  UsersView.swift
//  testApp
//
//  Created by Kolya Stypanovych on 13.08.2020.
//

import SwiftUI

struct UsersView: View {
    @ObservedObject var viewModel: UsersViewModel
    @State var showingAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.ids, id: \.self) { id in
                    NavigationLink(
                    destination: ProfileView(viewModel: ProfileViewModel(userId: id, api: API.shared))) {
                        RowView(viewModel: ProfileViewModel(userId: id, api: API.shared))
                    }
                    Spacer()
                }.navigationBarTitle("user_navbar_title".localized)
            }
        }.alert(isPresented: $showingAlert) {
            Alert(title: Text(""), message: Text("user_nil_userids".localized), dismissButton: .default(Text("user_alert_dismiss".localized)))
        }.onReceive(viewModel.errorSubject) { showAlert in
            self.showingAlert = showAlert
        }
    }
}

