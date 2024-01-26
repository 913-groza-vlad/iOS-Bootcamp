//
//  Comment.swift
//  curs23nov
//
//  Created by Vlad Groza on 23.11.2023.
//

import Foundation

struct Comment: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let content: String
    
    enum CodingKeys: String, CodingKey {
        case postId = "postId"
        case id
        case name
        case email
        case content = "body"
    }
}
