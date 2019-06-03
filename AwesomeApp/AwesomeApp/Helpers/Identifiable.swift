//
//  Identifiable.swift
//  AwesomeApp
//
//  Created by Apple on 31/05/2019.
//  Copyright © 2019 Vonny. All rights reserved.
//

import Foundation

public protocol Identifiable {
    static var identifier: String { get }
}

public extension Identifiable {
    static var identifier: String {
        return String(describing: self)
    }
}
