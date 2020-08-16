//
//  Localizable.swift
//  testApp
//
//  Created by Kolya Stypanovych on 16.08.2020.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(
            self,
            tableName: nil,
            bundle: Bundle.main,
            value: "",
            comment: ""
        )
    }
}
