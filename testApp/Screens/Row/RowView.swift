//
//  RowView.swift
//  testApp
//
//  Created by Kolya Stypanovych on 13.08.2020.
//


import SwiftUI


struct RowView: View {
    
    @ObservedObject var viewModel: RowViewModel
    @State var showingAlert = false
    
    var body: some View {
        VStack {
            Text(getTitle())
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(""), message: Text("user_nil_userids".localized), dismissButton: .default(Text("user_alert_dismiss".localized)))
        }.onReceive(viewModel.errorSubject) { showAlert in
            self.showingAlert = showAlert
        }
    }
    
    func getTitle() -> String {
        if let firstName = viewModel.user?.firstName {
            return firstName
        }
        return "error"
    }
}
