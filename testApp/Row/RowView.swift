//
//  RowView.swift
//  testApp
//
//  Created by Kolya Stypanovych on 13.08.2020.
//


import SwiftUI


struct RowView: View {
    
    @ObservedObject var viewModel: RowViewModel
    
    var body: some View {
        Text(viewModel.firstName)
    }
}
