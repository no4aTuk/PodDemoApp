//
//  PostsCell.swift
//  AwesomeApp
//
//  Created by Vonny on 18/05/2019.
//  Copyright © 2019 Vonny. All rights reserved.
//

import Foundation
import UIKit

public class PostsCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    public func setup(title: String?, description: String?) {
        self.titleLabel.text = title
        self.descriptionLabel.text = description
    }
}
