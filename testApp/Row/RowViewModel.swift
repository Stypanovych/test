//
//  RowViewModel.swift
//  testApp
//
//  Created by Kolya Stypanovych on 14.08.2020.
//

import SwiftUI


class RowViewModel: ObservableObject {
    var firstName: String
    
    init(firstName: String) {
        self.firstName = firstName
    }
}
