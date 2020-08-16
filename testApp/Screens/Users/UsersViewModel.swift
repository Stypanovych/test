//
//  UsersViewModel.swift
//  testApp
//
//  Created by Kolya Stypanovych on 13.08.2020.
//

import SwiftUI
import Combine


class UsersViewModel: ObservableObject {
    
    var errorSubject = PassthroughSubject<Bool,Never>()
    
    @Published var ids = [String]()
    
    private var api: APIProtocol
    
    
    init(api: APIProtocol) {
        self.api = api
        
        getUsersIDs()
    }
    
    func getUsersIDs() {
        api.getUsersIDs() {[weak self] (userResponse) in
            do {
                self?.ids = try userResponse.get().data
            } catch {
                self?.errorSubject.send(true)
            }
        }
    }
}

