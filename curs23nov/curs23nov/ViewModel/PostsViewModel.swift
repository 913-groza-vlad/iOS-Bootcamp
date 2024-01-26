//
//  PostViewModel.swift
//  curs23nov
//
//  Created by Vlad Groza on 23.11.2023.
//

import Foundation

protocol PostsViewModelDelegate {
    func postsDidLoad(posts: [Post])
    func postsDidLoadWithFailure(error: Error)
    func postsAreLoading()
}

class PostsViewModel {
    private let postsService = PostsService.shared
    var delegate: PostsViewModelDelegate?
    
    func loadPosts() {
        delegate?.postsAreLoading()
        postsService.loadPosts() { posts, error in
            if let posts {
                self.delegate?.postsDidLoad(posts: posts)
            }
            else if let error {
                self.delegate?.postsDidLoadWithFailure(error: error)
            }
        }
    }
}
