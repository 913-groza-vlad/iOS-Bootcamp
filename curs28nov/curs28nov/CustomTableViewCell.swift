//
//  CustomTableViewCell.swift
//  curs28nov
//
//  Created by Vlad Groza on 28.11.2023.
//

// Tema -> aplicatie cu un singur ecran care sa afiseze o lista de nume.
// Numele vor fi grupate pe sectiuni si sectiunile vor avea un header compus din prima litera
// a numelor aflate in sectiune
// Optional: adaugati un TextField prin care sa inserati elemente in tabel la apasarea butonului Return

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet private weak var listItemLabel: UILabel!
    
    override func prepareForReuse() {
        backgroundColor = .lightGray
    }
    
    func configure(string: String) {
        listItemLabel.text = string
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        listItemLabel.textColor = .red
        listItemLabel.backgroundColor = .green

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
            // backgroundColor = .blue
            listItemLabel.textColor = .magenta
        }
        else {
            listItemLabel.textColor = .red
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            listItemLabel.font = UIFont.systemFont(ofSize: 20)
        }
        else {
            listItemLabel.font = UIFont.systemFont(ofSize: 12)
        }
    }

}
