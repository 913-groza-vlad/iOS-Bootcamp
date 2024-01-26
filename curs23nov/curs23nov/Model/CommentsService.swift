//
//  DataManager.swift
//  curs23nov
//
//  Created by Vlad Groza on 23.11.2023.
//

import Foundation

struct MessageError: Error {
    let message: String
}

class CommentsService {
    private let commentsAPI = CommentsAPI()
    static let shared =  CommentsService()
    
    private init() {}
    
    func loadComments(
        postId: Int,
        completionHandler: @escaping ([Comment]?, Error?) -> Void
    ) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            let dummyError = MessageError(message: "Dummy error")
//            completionHandler(nil, dummyError)
//        }
        
        commentsAPI.loadComments(postId: postId, completionHandler: completionHandler)

    }

}
