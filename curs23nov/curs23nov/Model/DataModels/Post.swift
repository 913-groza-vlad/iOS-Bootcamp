//
//  Post.swift
//  curs23nov
//
//  Created by Vlad Groza on 23.11.2023.
//

import Foundation

struct Post: Decodable, Encodable { // Codable
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
