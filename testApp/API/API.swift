//
//  BaseAPI.swift
//  testApp
//
//  Created by Kolya Stypanovych on 13.08.2020.
//

import Foundation
import Alamofire


class API: BaseService {
    
    static let shared = API()
    
    func getPeopleID(token: String, completion: @escaping (AFResult<UserData>)->Void) -> DataRequest {
        let header = HTTPHeader(name: "Authorization", value: "Bearer " + token)
        let headers = HTTPHeaders([header])
        let path = "http://opn-interview-service.nn.r.appspot.com/list"
        return executeRequest(path: path,
                                  method: .get,
                                  encoding: JSONEncoding.default,
                                  parameters: nil,
                                  headers: headers,
                                  queue: DispatchQueue.main,
                                  completionHandler: completion)
    }
    
    func getPeople(token: String, id: String, completion: @escaping (AFResult<UserData>)->Void) -> DataRequest {
        let header = HTTPHeader(name: "Authorization", value: "Bearer " + token)
        let headers = HTTPHeaders([header])
        let path = "http://opn-interview-service.nn.r.appspot.com/get/\(id)"
        return executeRequest(path: path,
                                  method: .get,
                                  encoding: JSONEncoding.default,
                                  parameters: nil,
                                  headers: headers,
                                  queue: DispatchQueue.main,
                                  completionHandler: completion)
    }
}
