//
//  BaseApiRouter.swift
//  AFNetworkLayer
//
//  Created by Vonny on 19/05/2019.
//

import Foundation
import Alamofire

public protocol BaseApiRouter: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}

extension BaseApiRouter {
    
    //TODO base url put into some configuration object
    var baseURL: String {
        //return "https://jsonplaceholder.typicode.com"
        return ApiConstants.baseUrl
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        //Http method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ApiConstants.ContentType.json.rawValue, forHTTPHeaderField: ApiConstants.HttpHeaderField.acceptType.rawValue)
        urlRequest.setValue(ApiConstants.ContentType.json.rawValue, forHTTPHeaderField: ApiConstants.HttpHeaderField.contentType.rawValue)
        
        //Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }
}
