//
//  PostModel.swift
//  curs14dec_urlSchemes
//
//  Created by Vlad Groza on 14.12.2023.
//

import Foundation

struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
