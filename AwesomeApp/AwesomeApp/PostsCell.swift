//
//  PostsCell.swift
//  AwesomeApp
//
//  Created by Vonny on 18/05/2019.
//  Copyright © 2019 Vonny. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public class PostsCell: UITableViewCell, Identifiable {
    private var titleLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont.kefa(.bold, size: 20)
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .lightGray
        label.font = UIFont.kefa(.medium, size: 14)
        return label
    }()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private func setupUI() {
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        
        titleLabel.snp.makeConstraints { (maker) in
            maker.leading.trailing.equalTo(contentView).offset(16)
            maker.top.equalTo(contentView).offset(8)
            maker.bottom.equalTo(descriptionLabel.snp.top).offset(-8)
        }
        
        titleLabel.setContentHuggingPriority(.init(252), for: .vertical)
        
        descriptionLabel.snp.makeConstraints { (maker) in
            maker.leading.trailingMargin.equalTo(contentView).offset(16)
            maker.bottom.equalTo(contentView).offset(-8)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Do not use storyboard bro!")
    }
    
    public func setup(title: String?, description: String?) {
        self.titleLabel.text = title
        self.descriptionLabel.text = description
    }
}
