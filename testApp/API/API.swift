//
//  BaseAPI.swift
//  testApp
//
//  Created by Kolya Stypanovych on 13.08.2020.
//

import Foundation
import Alamofire


class API: APIProtocol {
    
    static let shared = API()
    
    private let session: Session
    
    private init (interseptor: Alamofire.RequestInterceptor = APIInterceptor()) {
        self.session = Session(configuration: .default,  interceptor: interseptor)
    }
    
    func getUsersIDs(completion: @escaping (Result<UserDataIDs, Error>) -> Void) {
        let path = "http://opn-interview-service.nn.r.appspot.com/list"
        _ = executeRequest(urlString: path,
                           method: .get,
                           encoding: JSONEncoding.default,
                           parameters: nil,
                           queue: DispatchQueue.main,
                           completionHandler: completion)
    }
    
    func getUserProfile(with id: String,
                        completion: @escaping (Result<UserData, Error>) -> Void) {
        let path = "http://opn-interview-service.nn.r.appspot.com/get/\(id)"
        _ = executeRequest(urlString: path,
                           method: .get,
                           encoding: JSONEncoding.default,
                           parameters: nil,
                           queue: DispatchQueue.main,
                           completionHandler: completion)
    }
    
    static var queue = DispatchQueue(label: "api.service",
                                     attributes: DispatchQueue.Attributes.concurrent)
    
    
    
    
    //MARK: - Private
    
    private func executeRequest<T: Codable>(urlString: String,
                                            method: HTTPMethod = .get,
                                            encoding: ParameterEncoding = JSONEncoding.default,
                                            parameters: Parameters?,
                                            queue: DispatchQueue,
                                            completionHandler: @escaping (_ result: Result<T, Error>) -> Void) -> DataRequest {
        
        var jsonDataResponse: AFDataResponse<Any>?
        
        return session.request(
            urlString,
            method: method,
            parameters: parameters,
            encoding: encoding
        ).validate().responseJSON(completionHandler: { dataResponse in
            
            jsonDataResponse = dataResponse
        }).responseCodable(queue: API.queue) { (result: Result<T, Error>) in
            
            self.logRequest(
                urlString: urlString,
                method: method,
                parameters: parameters,
                error: nil,
                dataResponse: jsonDataResponse
            )
            
            queue.async {
                completionHandler(result)
            }
        }
    }
    
    private func logRequest(urlString: String,
                            method: HTTPMethod,
                            parameters: Parameters?,
                            error: Error?,
                            dataResponse: AFDataResponse<Any>?) {
        print(
            "\n====================================" +
                "\nrequest: url: \(urlString)" +
                "\nmethod: \(method)" +
                "\nparameters: \(String(describing: parameters))" +
                "\n---------------------------------" +
                "\ncode: \(String(describing: dataResponse?.response?.statusCode))" +
                "\nerror: \(String(describing: error))" +
                "\nresponse: \(String(describing: dataResponse?.value))" +
            "\n====================================\n"
        )
    }
}
