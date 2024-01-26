//
//  CommentsViewModel.swift
//  curs23nov
//
//  Created by Vlad Groza on 26.11.2023.
//

import Foundation

protocol CommentsViewModelDelegate: AnyObject {
    func commentsDidLoad(comments: [Comment])
    func commentsDidLoadWithFailure(error: Error)
    func commentsAreLoading()
}

class CommentsViewModel {
    private let commentsService = CommentsService.shared
    weak var delegate: CommentsViewModelDelegate?
    private(set) var comments: [Comment]?
    
    func loadComments(postId: Int) {
        delegate?.commentsAreLoading()
        commentsService.loadComments(postId: postId) { [weak self] comments, error in
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
