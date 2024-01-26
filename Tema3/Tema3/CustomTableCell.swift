//
//  CustomTableCell.swift
//  Tema3
//
//  Created by Vlad Groza on 29.11.2023.
//

import Foundation
import Foundation
import UIKit

class CustomTableCell: UITableViewCell {

    @IBOutlet private weak var listItemLabel: UILabel!
    
    override func prepareForReuse() {
        backgroundColor = .white
    }
    
    func configure(string: String) {
        listItemLabel.text = string
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        listItemLabel.textColor = .purple

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            listItemLabel.font = UIFont.systemFont(ofSize: 22)
        }
        else {
            listItemLabel.font = UIFont.systemFont(ofSize: 20)
        }
    }

}
