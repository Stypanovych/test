//
//  APIError.swift
//  testApp
//
//  Created by Kolya Stypanovych on 15.08.2020.
//

import Foundation


enum APIError: Error {
    case serverErrorUnauthorized
    case serverErrorNotFound
    case serverError
    case requestError(message: String)
    case decodingError
}
