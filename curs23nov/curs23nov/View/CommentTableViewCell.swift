//
//  CommentTableViewCell.swift
//  curs23nov
//
//  Created by Vlad Groza on 30.11.2023.
//

import Foundation
import UIKit

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var commentLabel: UILabel!
    
    func configure(comment: Comment) {
        commentLabel.text = comment.content
    }
}
