//
//  PostsService.swift
//  curs23nov
//
//  Created by Vlad Groza on 26.11.2023.
//

import Foundation

class PostsService {
    private let postsAPI = PostsAPI()
    static let shared = PostsService()
    
    private init() {}
    
    func loadPosts(
        completionHandler: @escaping ([Post]?, Error?) -> Void
    ) {
        postsAPI.loadPosts(completionHandler: completionHandler)
    }
}
