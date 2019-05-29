//
//  PostsRouter.swift
//  AwesomeApp
//
//  Created by Vonny on 19/05/2019.
//  Copyright © 2019 Vonny. All rights reserved.
//

import Foundation
import AFNetworkLayer
import Alamofire

public enum PostsRouter: BaseApiRouter {
    
    //The endpoint name we'll call later
    case getPosts(userId: Int)
    
    //MARK: - URLRequestConvertible
    //    func asURLRequest() throws -> URLRequest {
    //        let url = try Constants.baseUrl.asURL()
    //
    //        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
    //
    //        //Http method
    //        urlRequest.httpMethod = method.rawValue
    //
    //        // Common Headers
    //        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.acceptType.rawValue)
    //        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
    //
    //        //Encoding
    //        let encoding: ParameterEncoding = {
    //            switch method {
    //            case .get:
    //                return URLEncoding.default
    //            default:
    //                return JSONEncoding.default
    //            }
    //        }()
    //
    //        return try encoding.encode(urlRequest, with: parameters)
    //    }
    
    //MARK: - HttpMethod
    //This returns the HttpMethod type. It's used to determine the type if several endpoints are peresent
    public var method: HTTPMethod {
        switch self {
        case .getPosts:
            return .get
        }
    }
    
    //MARK: - Path
    //The path is the part following the base url
    public var path: String {
        switch self {
        case .getPosts:
            return "posts"
        }
    }
    
    //MARK: - Parameters
    //This is the queries part, it's optional because an endpoint can be without parameters
    public var parameters: Parameters? {
        switch self {
        case .getPosts(let userId):
            //A dictionary of the key (From the constants file) and its value is returned
            return ["userId" : userId]
        }
    }
}

