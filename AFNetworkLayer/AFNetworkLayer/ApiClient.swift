//
//  BaseRequest.swift
//  AFNetworkLayer
//
//  Created by Vonny on 18/05/2019.
//  Copyright © 2019 Vonny. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

public class ApiClient {
    
    public static let shared: ApiClient = ApiClient()
    
    private init() {}
    
    private var apiClient: SessionManager = {
        let configuration = URLSessionConfiguration.default

        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 300
        return Alamofire.SessionManager(configuration: configuration)
    }()
    
    public func request<T: Codable> (_ urlConvertible: BaseApiRouter) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = self.apiClient.request(urlConvertible).responseData(completionHandler: { (response) in
                switch response.result {
                case .success(let value):
                    do {
                        let result = try JSONDecoder().decode(T.self, from: value)
                        observer.onNext(result)
                        observer.onCompleted()
                    } catch {
                        observer.onError(error)
                    }

                case .failure(let error):
                    switch response.response?.statusCode {
                    case 403:
                        observer.onError(ApiError.forbidden)
                    case 404:
                        observer.onError(ApiError.notFound)
                    case 409:
                        observer.onError(ApiError.conflict)
                    case 500:
                        observer.onError(ApiError.internalServerError)
                    default:
                        observer.onError(error)
                    }
                }
            })


            //Finally, we return a disposable to stop the request
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
