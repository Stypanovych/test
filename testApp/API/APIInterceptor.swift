//
//  APIInterceptor.swift
//  testApp
//
//  Created by Kolya Stypanovych on 15.08.2020.
//

import Alamofire
import Foundation


class APIInterceptor: Alamofire.RequestInterceptor {

     // MARK: - RequestAdapter
     /// Alamofire requests this func on each request because of extention in `Alamofire.RequestInterceptor`
     func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {

         
        guard let token = JWTCreator.getJWTToken() else {
             return
         }
         var adaptedRequest = urlRequest
         ///add the token to the request
         adaptedRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
         completion(.success(adaptedRequest))
     }
     
     // MARK: - RequestRetrier
     /// Alamofire requests this func on each request because of extention in `Alamofire.RequestInterceptor`
     func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        
        switch request.response?.statusCode {
        case 401:
            //in case we have refresh token
            break
        case 500:
            completion(.retryWithDelay(1))
        default:
            completion(.doNotRetry)
        }
     }
}
