//
//  UsersView.swift
//  testApp
//
//  Created by Kolya Stypanovych on 13.08.2020.
//

import SwiftUI

struct UsersView: View {
    @ObservedObject var viewModel = UsersViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.users) { user in
                    NavigationLink(
                    destination: ProfileView(viewModel: ProfileViewModel(user: user))) {
                        Text(user.firstName)
                            .font(.system(size: 20))
                            .frame(width: 200 , height: 50, alignment: .center)
                    }
                    Spacer()
                }.navigationBarTitle("user_navbar_title".localized)
            }
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
