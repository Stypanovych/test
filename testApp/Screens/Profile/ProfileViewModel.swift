//
//  ProfileViewModel.swift
//  testApp
//
//  Created by Kolya Stypanovych on 14.08.2020.
//

import SwiftUI
import Combine


class ProfileViewModel: ObservableObject {
    
    var errorSubject = PassthroughSubject<String,Never>()
    private var api: APIProtocol
    @Published var user: User?
    
    init(userId: String, api: APIProtocol) {
        self.api = api
        getUserProfile(id: userId)
    }
    
    func getUserProfile(id: String) {
        api.getUserProfile(with: id) {[weak self] (userResponse) in
            do {
                guard let user = try userResponse.get().data else {
                    self?.errorSubject.send("data_error".localized)
                    return
                }
                self?.user = user
            } catch {
                self?.errorSubject.send(error.localizedDescription)
            }
        }
    }
}
