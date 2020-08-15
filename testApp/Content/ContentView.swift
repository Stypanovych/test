//
//  ContentView.swift
//  testApp
//
//  Created by Kolya Stypanovych on 13.08.2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    
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
                }.navigationBarTitle("People")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
