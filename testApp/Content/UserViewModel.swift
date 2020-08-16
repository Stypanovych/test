//
//  UsersViewModel.swift
//  testApp
//
//  Created by Kolya Stypanovych on 13.08.2020.
//

import SwiftUI


class UsersViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    var token: String = ""
    
    var ids = [String]() {
        didSet {
            for id in ids {
                getPeople(api: API.shared, id: id)
            }
        }
    }
    
    init() {
        guard let token = JWTCreator.getJWTToken() else { return }
        self.token = token
        
        getPeopleID(api: API.shared)
    }
    
    func getPeopleID(api: APIProtocol) {
        _ = api.getPeopleID(token: token) {[weak self] (user) in
            do {
                self?.ids = try user.get().data
            } catch {
                print("error of getting list of ids")
            }
        }
    }
    
    func getPeople(api: APIProtocol, id: String) {
        _ = api.getPeople(token: token, id: id) {[weak self] (userData) in
            do {
                guard let user = try userData.get().data else {
                    print(try userData.get().status)
                    return
                }
                self?.users.append(user)
            } catch {
                print("error of getting list of people")
            }
        }
    }
}

