
//
//  File.swift
//  AwesomeApp
//
//  Created by Vonny on 19/05/2019.
//  Copyright © 2019 Vonny. All rights reserved.
//

import Foundation
import RxSwift
import AFNetworkLayer

public struct PostsService {
    public func getPosts(userId: Int) -> Observable<[Post]> {
        //return request(ApiRouter.getPosts(userId: userId))
        return ApiClient.shared.request(PostsRouter.getPosts(userId: userId))
    }
    
//    public func getPosts(userId: Int, completion: @escaping ([Post]?, Error?) -> Void) {
//        let router = PostsRouter.getPosts(userId: 1)
//        let api = ApiClient.shared
//
//    }
}
