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
    
    private init () {
        let interseptor = APIInterceptor()
        self.session = Session(configuration: .default,  interceptor: interseptor)
    }
    
    func getPeopleID(token: String,
                     completion: @escaping (Result<UserDataIDs, APIError>) -> Void) -> DataRequest {
        let header = HTTPHeader(name: "Authorization", value: "Bearer " + token)
        let headers = HTTPHeaders([header])
        let path = "http://opn-interview-service.nn.r.appspot.com/list"
        return executeRequest(urlString: path,
                              method: .get,
                              encoding: JSONEncoding.default,
                              parameters: nil,
                              headers: headers,
                              queue: DispatchQueue.main,
                              completionHandler: completion)
    }
    
    func getPeople(token: String, id: String,
                   completion: @escaping (Result<UserData, APIError>) -> Void) -> DataRequest {
        let header = HTTPHeader(name: "Authorization", value: "Bearer " + token)
        let headers = HTTPHeaders([header])
        let path = "http://opn-interview-service.nn.r.appspot.com/get/\(id)"
        return executeRequest(urlString: path,
                              method: .get,
                              encoding: JSONEncoding.default,
                              parameters: nil,
                              headers: headers,
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
                                            headers: HTTPHeaders? = nil,
                                            queue: DispatchQueue,
                                            completionHandler: @escaping (_ result: Result<T, APIError>) -> Void) -> DataRequest {
        
        var jsonDataResponse: AFDataResponse<Any>?
        
        return session.request(
            urlString,
            method: method,
            parameters: parameters,
            encoding: encoding,
            headers: headers
        ).validate().responseJSON(completionHandler: { dataResponse in
            
            jsonDataResponse = dataResponse
        }).responseCodable(queue: API.queue) { (result: Result<T, APIError>) in
            
            self.logRequest(
                urlString: urlString,
                method: method,
                headers: headers,
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
                            headers: HTTPHeaders?,
                            parameters: Parameters?,
                            error: Error?,
                            dataResponse: AFDataResponse<Any>?) {
        print(
            "\n====================================" +
                "\nrequest: url: \(urlString)" +
                "\nmethod: \(method)" +
                "\nheaders: \(String(describing: headers))" +
                "\nparameters: \(String(describing: parameters))" +
                "\n---------------------------------" +
                "\ncode: \(String(describing: dataResponse?.response?.statusCode))" +
                "\nerror: \(String(describing: error))" +
                "\nresponse: \(String(describing: dataResponse?.value))" +
            "\n====================================\n"
        )
    }
}
