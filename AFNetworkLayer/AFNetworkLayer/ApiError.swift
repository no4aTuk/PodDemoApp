//
//  ApiError.swift
//  AFNetworkLayer
//
//  Created by Vonny on 18/05/2019.
//  Copyright © 2019 Vonny. All rights reserved.
//

import Foundation

public enum ApiError: Error {
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case conflict               //Status code 409
    case internalServerError    //Status code 500
    case invalidBaseUrl
}
