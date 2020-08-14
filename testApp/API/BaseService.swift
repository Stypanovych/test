//
//  BaseService.swift
//  Sahara
//
//  Created by Kolya Stypanovych on 22.03.2020.
//  Copyright © 2020 StarGo. All rights reserved.
//

import Foundation
import Alamofire


class BaseService {
    
    static var queue = DispatchQueue(label: "api.service",
                                     attributes: DispatchQueue.Attributes.concurrent)

    
    //MARL: - Public
    
    func executeRequest<T: Codable>(path: String = "",
                                    method: HTTPMethod = .get,
                                    encoding: ParameterEncoding = JSONEncoding.default,
                                    parameters: Parameters?,
                                    headers: HTTPHeaders?,
                                    queue: DispatchQueue,
                                    completionHandler: @escaping (_ result: AFResult<T>) -> Void) -> DataRequest {
        
        return executeRequest(
            urlString: path,
            method: method,
            encoding: encoding,
            parameters: parameters,
            headers: headers,
            queue: queue,
            completionHandler: completionHandler
        )
    }
    
    private func executeRequest<T: Codable>(urlString: String,
                                    method: HTTPMethod = .get,
                                    encoding: ParameterEncoding = JSONEncoding.default,
                                    parameters: Parameters?,
                                    headers: HTTPHeaders? = nil,
                                    queue: DispatchQueue,
                                    completionHandler: @escaping (_ result: AFResult<T>) -> Void) -> DataRequest {

        var jsonDataResponse: AFDataResponse<Any>?
        
        return AF.request(
            urlString,
            method: method,
            parameters: parameters,
            encoding: encoding,
            headers: headers
            ).responseJSON(completionHandler: { dataResponse in
                
                jsonDataResponse = dataResponse
            }).responseCodable(queue: BaseService.queue) { (result: AFResult<T>) in
                
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
    
    
    //MARK: - Private
    
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
//                "\ncode: \(String(describing: dataResponse?.response?.statusCode))" +
                "\nerror: \(String(describing: error))" +
                //                "\nerrorDescription: \(error ?? "")" +
                "\nresponse: \(String(describing: dataResponse?.value))" +
            "\n====================================\n"
        )
    }
}



