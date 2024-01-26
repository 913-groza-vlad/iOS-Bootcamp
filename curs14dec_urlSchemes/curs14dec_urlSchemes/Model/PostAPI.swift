//
//  PostAPI.swift
//  curs14dec_urlSchemes
//
//  Created by Vlad Groza on 14.12.2023.
//

import Foundation

class PostAPI {
    func loadPost(postId: Int, completionHandler: @escaping (Post?, Error?) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(String(postId))")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let request = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
            if let error {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
            }
            else {
                do {
                    let post = try JSONDecoder().decode(Post.self, from: data!)
                    DispatchQueue.main.async {
                        completionHandler(post, nil)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completionHandler(nil, error)
                    }
                }
            }
        }
        
        request.resume()
    }
}
