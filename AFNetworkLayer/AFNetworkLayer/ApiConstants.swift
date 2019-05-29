//
//  Constants.swift
//  AFNetworkLayer
//
//  Created by Vonny on 18/05/2019.
//  Copyright © 2019 Vonny. All rights reserved.
//

import Foundation

public struct ApiConstants {
    
    //TODO base url put into some configuration object
    static let baseUrl = "https://jsonplaceholder.typicode.com"
    
    //The parameters (Queries) that we're gonna use
//    struct Parameters {
//        static let userId = "userId"
//    }
//
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    //The content type (JSON)
    enum ContentType: String {
        case json = "application/json"
    }
}
