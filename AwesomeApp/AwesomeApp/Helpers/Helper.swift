//
//  Helper.swift
//  AwesomeApp
//
//  Created by Apple on 31/05/2019.
//  Copyright © 2019 Vonny. All rights reserved.
//

import Foundation
import UIKit

struct RuntimeError: Error {
    let message: String
    
    init(_ message: String...) {
        self.message = message.joined(separator: " ")
    }
    
    public var localizedDescription: String {
        return message
    }
}

extension UITableView {
    public func register<T: UITableViewCell&Identifiable>(cell: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.identifier)
    }
}

extension UIFont {
    
    enum FontType: String {
        case regular = "Regular"
        case medium = "Medium"
        case bold = "Bold"
        case italic = "Italic"
    }
    
    static func kefa(_ type: FontType, size: CGFloat) -> UIFont {
        let name = "Kefa"
        return UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
