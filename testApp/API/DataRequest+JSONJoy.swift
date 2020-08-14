//
//  DataRequest+JSONJoy.swift
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
        completionHandler: @escaping (AFResult<T>) -> Void)
        -> Self {
            
            return responseData(queue: queue) { dataResponse in
                if let error = dataResponse.error {
                    
                    completionHandler(
                        AFResult.failure(error)
                    )
                    return
                    
                } else if let data = dataResponse.data {
                    
                    let decoder = JSONDecoder()
                    
                    do {
                        let t = try decoder.decode(T.self, from: data)
                        
                        completionHandler(
                            AFResult.success(t)
                        )
                    } catch {
                        print("BaseService: error trying to convert data to JSON; error: \(error)")

                    }
                }
            }
    }
}

