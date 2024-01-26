//
//  OurFirstViewController.swift
//  curs2-1
//
//  Created by Vlad Groza on 16.11.2023.
//

import UIKit

class OurFirstViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet private weak var centeredView: UIView!
    @IBOutlet private weak var topButton: UIButton!
    @IBOutlet private weak var label: UILabel!
    
    var passedString: String?
    
    var isBlack = true
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centeredView.cornerRadius = 20
        view.backgroundColor = UIColor.red
        topButton.backgroundColor = UIColor.yellow
        print(String(describing: type(of: self)), #function)
        label.text = passedString
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("\(Self.self)", #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(String(describing: type(of: self)), #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(String(describing: type(of: self)), #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print(String(describing: type(of: self)), #function)
    }
    
    @IBAction func onTopButtonPressedRepeat(_ sender: Any) {
        view.backgroundColor = UIColor.purple
    }
    
    @IBAction private func onTopButtonPressed(_ sender: Any) {
        if (isBlack == false) {
            view.backgroundColor = UIColor.red
            isBlack = true
        }
        else {
            view.backgroundColor =  UIColor.black
            isBlack = false
        }
    }
    
    
    @IBAction private func onButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueToSecondController", sender: nil)
    }

    
}
