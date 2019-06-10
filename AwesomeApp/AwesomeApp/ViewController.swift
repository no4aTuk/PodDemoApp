//
//  ViewController.swift
//  AwesomeApp
//
//  Created by Vonny on 18/05/2019.
//  Copyright © 2019 Vonny. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import YandexMapKit

class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        //tableView.register(PostsCell.self, forCellReuseIdentifier: PostsCell.identifier)
        tableView.register(cell: PostsCell.self)
        tableView.estimatedRowHeight = 120
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints({ (maker: ConstraintMaker) in
            maker.edges.equalTo(view.safeAreaLayoutGuide)
        })
        return tableView
    }()
    
    private var viewModel: PostsViewModel!
    private let dispodeBag = DisposeBag()
    
    public init(viewModel: PostsViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        let map = YMKPoint(latitude: 20, longitude: 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Posts"
        bindTableView()
        viewModel.loadPosts()
    }
    
    private func bindTableView() {
        viewModel.posts.asObservable().bind(to: tableView.rx.items(cellIdentifier: PostsCell.identifier, cellType: PostsCell.self)) { row, element, cell in
            cell.setup(title: element.title, description: element.body)
        }.disposed(by: dispodeBag)
    }
}

