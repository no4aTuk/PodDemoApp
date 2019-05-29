//
//  PostsViewModel.swift
//  AwesomeApp
//
//  Created by Vonny on 18/05/2019.
//  Copyright © 2019 Vonny. All rights reserved.
//

import Foundation
import RxSwift
import AFNetworkLayer

public class PostsViewModel {
    
    public let posts = PublishSubject<[Post]>()
    public let error = PublishSubject<Error>()
    
    private let service: PostsService
    
    init(postsService: PostsService) {
        self.service = postsService
    }
    
    private let disposeBag = DisposeBag()
    
    public func loadPosts() {
        
        //ApiClient.shared.getPosts(userId: 1)
        service.getPosts(userId: 1)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (posts) in
                print("Lists of posts: ", posts)
                self.posts.onNext(posts)
            }, onError: { (error) in
                switch error {
                case ApiError.conflict:
                    print("Conflict error")
                case ApiError.forbidden:
                    print("Forbidden error")
                case ApiError.notFound:
                    print("Not found error")
                default:
                    print("Unknown error:", error)
                }
                self.error.onNext(error)
            }).disposed(by: disposeBag)
        
//        service.getPosts(userId: 1) { (posts, error) in
//            print(posts, error)
//        }
    }
}
