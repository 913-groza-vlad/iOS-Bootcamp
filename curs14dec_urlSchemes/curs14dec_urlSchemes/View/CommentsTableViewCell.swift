//
//  CommentsTableViewCell.swift
//  curs14dec_urlSchemes
//
//  Created by Vlad Groza on 18.12.2023.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var commentLabel: UILabel!
    
    func configure(comment: Comment) {
        commentLabel.text = "Name: " + comment.name + "\nEmail: " + comment.email + "\nContent: " + comment.body
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        commentLabel.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
