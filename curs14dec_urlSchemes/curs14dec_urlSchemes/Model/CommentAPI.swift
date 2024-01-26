//
//  CommentAPI.swift
//  curs14dec_urlSchemes
//
//  Created by Vlad Groza on 18.12.2023.
//

import Foundation

class CommentsAPI {
    
    func loadComments(
        postId: Int,
        completionHandler: @escaping ([Comment]?, Error?) -> Void
    ) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/comments")!
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        urlComponents.queryItems = [
            URLQueryItem(name: "postId", value: String(postId))
        ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        
        let request = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
            if let data {
                do {
                    let comments = try JSONDecoder().decode([Comment].self, from: data)
                    DispatchQueue.main.async {
                        completionHandler(comments, nil)
                    }
                    
                }
                catch(let error) {
                    DispatchQueue.main.async {
                        completionHandler(nil, error)
                    }
                }
            }
            else {
                DispatchQueue.main.async {
                    completionHandler(nil, error!)
                }
            }
        }
        
        request.resume()
    }
}
