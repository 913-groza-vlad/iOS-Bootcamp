//
//  PostDetailsViewModel.swift
//  curs14dec_urlSchemes
//
//  Created by Vlad Groza on 14.12.2023.
//

import Foundation

protocol PostDetailsViewModelDelegate: AnyObject {
    func postIsLoading()
    func postDidLoad(post: Post)
    func postDidFail(error: Error)
}

class PostDetailsViewModel {
    
    weak var delegate: PostDetailsViewModelDelegate?
    private let postService = PostService.shared
    
    func loadPost(postId: Int) {
        delegate?.postIsLoading()
        postService.loadPost(postId: postId) { [weak self] post, error in
            guard let self else {return}
            if let error {
                self.delegate?.postDidFail(error: error)
            }
            else if let post {
                self.delegate?.postDidLoad(post: post)
            }
        }
    }
}
