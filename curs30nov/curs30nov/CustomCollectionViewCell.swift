//
//  CustomCollectionViewCell.swift
//  curs30nov
//
//  Created by Vlad Groza on 30.11.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    func configure(string: String) {
        label.text = string
    }
}
