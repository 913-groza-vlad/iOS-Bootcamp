//
//  ModalController.swift
//  curs21nov
//
//  Created by Orlando Neacsu on 21.11.2023.
//

import Foundation
import UIKit

class ModalController: UIViewController {
    
    override func viewDidLoad() {
        
    }
    
    @IBAction private func onClosePressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
