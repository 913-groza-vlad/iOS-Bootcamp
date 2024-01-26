//
//  CommentsViewModel.swift
//  curs14dec_urlSchemes
//
//  Created by Vlad Groza on 18.12.2023.
//

import Foundation

protocol CommentsViewModelDelegate: AnyObject {
    func commentsDidLoad(comments: [Comment])
    func commentsDidLoadWithFailure(error: Error)
    func commentsAreLoading()
}

class CommentsViewModel {
    private let service = PostService.shared
    weak var delegate: CommentsViewModelDelegate?
    private(set) var comments: [Comment]?
    
    func loadComments(postId: Int) {
        delegate?.commentsAreLoading()
        service.loadComments(postId: postId) { [weak self] comments, error in
            guard let self else { return }
            if let comments {
                self.comments = comments
                self.delegate?.commentsDidLoad(comments: comments)
            }
            else if let error {
                self.delegate?.commentsDidLoadWithFailure(error: error)
            }
        }
    }
}
