//
//  ContentViewModel.swift
//  testApp
//
//  Created by Kolya Stypanovych on 13.08.2020.
//

import SwiftUI


class ContentViewModel: ObservableObject {
    
    @Published var users = [User]()

    var token: String = ""
    
    var ids = [String]() {
        didSet {
            for id in ids {
                getPeople(id: id)
            }
        }
    }
    
    init() {
        guard let token = JWTCreator.getJWTToken() else { return }
        self.token = token
        
        getPeopleID()
    }
    
    func getPeopleID() {
        _ = API.shared.getPeopleID(token: token) {[weak self] (user) in
            do {
                self?.ids = try user.get().data
            } catch {
                print("error of getting list of ids")
            }
        }
    }
    
    func getPeople(id: String) {
        _ = API.shared.getPeople(token: token,
                             id: id) {[weak self] (user) in
                                do {
                                    self?.users.append(try user.get().data)
                                } catch {
                                    print("error of getting list of people")
                                }
        }
    }
}

