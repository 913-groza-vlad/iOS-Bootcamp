//
//  CommentModel.swift
//  curs14dec_urlSchemes
//
//  Created by Vlad Groza on 18.12.2023.
//

import Foundation

struct Comment: Decodable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
