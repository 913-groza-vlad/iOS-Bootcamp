//
//  PostsAPI.swift
//  curs23nov
//
//  Created by Vlad Groza on 26.11.2023.
//

import Foundation

class PostsAPI {
    
    func loadPosts(completionHandler: @escaping ([Post]?, Error?) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        let request = URLSession.shared.dataTask(
            with: urlRequest) { data, response, error in
                if let data {
                    do {
                        let posts = try JSONDecoder().decode([Post].self, from: data)
                        DispatchQueue.main.async {
                            completionHandler(posts, nil)
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
