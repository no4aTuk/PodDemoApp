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

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = PostsViewModel(postsService: PostsService())
    private let dispodeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindTableView()
        viewModel.loadPosts()
    }
    
    private func bindTableView() {
        tableView.estimatedRowHeight = 50
        viewModel.posts.asObservable().bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: PostsCell.self)) { row, element, cell in
            cell.setup(title: element.title, description: element.body)
        }.disposed(by: dispodeBag)
    }
}

