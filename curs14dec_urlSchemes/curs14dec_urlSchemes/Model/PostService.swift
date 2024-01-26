//
//  PostService.swift
//  curs14dec_urlSchemes
//
//  Created by Vlad Groza on 14.12.2023.
//

import Foundation

class PostService {
    private let postAPI = PostAPI()
    private let commentAPI = CommentsAPI()
    static let shared = PostService()
    
    private init() {}
    
    func loadPost(
        postId: Int,
        completionHandler: @escaping (Post?, Error?) -> Void
    ) {
        postAPI.loadPost(postId: postId, completionHandler: completionHandler)
    }
    
    func loadComments(
        postId: Int,
        completionHandler: @escaping ([Comment]?, Error?) -> Void
    ) {
        commentAPI.loadComments(postId: postId, completionHandler: completionHandler)
    }
}
