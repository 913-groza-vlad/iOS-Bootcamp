//
//  ModalController.swift
//  curs14dec_delegates
//
//  Created by Vlad Groza on 14.12.2023.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func changeViewControllerBackgroundColor(color: UIColor)
}

class ModalController: UIViewController {
    
    weak var delegate: ViewControllerDelegate?
    var changeBackgroundColorAction: ((UIColor) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction private func onChangeViewControllerPressed(_ sender: Any) {
        let red = CGFloat(Int.random(in: (0...255))) / CGFloat(255)
        let green = CGFloat(Int.random(in: (0...255))) / CGFloat(255)
        let blue = CGFloat(Int.random(in: (0...255))) / CGFloat(255)
        let randomColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        if let delegate = delegate {
            delegate.changeViewControllerBackgroundColor(color: randomColor)
        }
        else if let changeBackgroundColorAction = changeBackgroundColorAction {
            changeBackgroundColorAction(randomColor)
        }
    }
}
