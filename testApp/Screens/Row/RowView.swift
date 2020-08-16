//
//  RowView.swift
//  testApp
//
//  Created by Kolya Stypanovych on 13.08.2020.
//


import SwiftUI


struct RowView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    @State var errorText = ""
    
    var body: some View {
        VStack {
            Text(viewModel.user?.firstName ?? errorText)
        }.onReceive(viewModel.errorSubject) { (localizedError) in
            self.errorText = localizedError
        }
    }
}
