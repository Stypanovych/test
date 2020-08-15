//
//  DataRequest+Codable.swift
//  Sahara
//
//  Created by Kolya Stypanovych on 22.03.2020.
//  Copyright © 2020 StarGo. All rights reserved.
//

import Alamofire
import Foundation


//MARK: - Public methods

extension DataRequest {
    
    func responseCodable<T: Codable>(
        queue: DispatchQueue,
        completionHandler: @escaping (Result<T, APIError>) -> Void)
        -> Self {
            
            return responseData(queue: queue) { dataResponse in
                if let error = dataResponse.error {
                    
                    completionHandler(
                        .failure(.requestError(message: error.localizedDescription))
                    )
                    return
                    
                } else if let data = dataResponse.data {
                    guard dataResponse.response?.statusCode == 200 else {
                        switch dataResponse.response?.statusCode {
                        case 401:
                            completionHandler(.failure(.serverErrorUnauthorized))
                        case 404:
                            completionHandler(.failure(.serverErrorNotFound))
                        default:
                            completionHandler(.failure(.serverError))
                        }
                        return
                    }
                    
                    let decoder = JSONDecoder()
                    
                    do {
                        let t = try decoder.decode(T.self, from: data)
                        
                        completionHandler(
                            .success(t)
                        )
                    } catch {
                        print("BaseService: error trying to convert data to JSON; error: \(error)")
                        completionHandler(.failure(.decodingError))
                    }
                    
                }
            }
    }
}

