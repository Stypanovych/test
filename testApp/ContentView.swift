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
        VStack {
            ForEach(viewModel.users, id: \.self) { user in
                Button(action: {
                    
                }) {
                    Text(user.firstName)
                }
            }
            Text("Hello, World!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
