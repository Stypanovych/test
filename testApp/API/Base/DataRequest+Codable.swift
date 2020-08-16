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
        completionHandler: @escaping (Result<T, Error>) -> Void)
        -> Self {
            
            return responseData(queue: queue) { dataResponse in
                if let data = dataResponse.data {
                    let decoder = JSONDecoder()
                    
                    do {
                        let t = try decoder.decode(T.self, from: data)
                        
                        completionHandler(
                            .success(t)
                        )
                    } catch {
                        print("BaseService: error trying to convert data to JSON; error: \(error)")
                        completionHandler(.failure(error))
                    }
                    
                }
            }
    }
}

