//
//  ViewController.swift
//  curs2-1
//
//  Created by Orlando Neacsu on 14.11.2023.
//

import UIKit

extension UIView {
    var cornerRadius: CGFloat {
        get {
            self.layer.cornerRadius
        }
        
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet private weak var topView: UIView!
    @IBOutlet private weak var bottomView: UIView!
    @IBOutlet private weak var textField: UITextField!
    private let segueToOurFirstViewController = "segueToOurFirstViewController"
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topView.backgroundColor = UIColor.green
        bottomView.backgroundColor = UIColor.red
        bottomView.cornerRadius = 10;
        print(String(describing: type(of: self)), #function)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToOurFirstViewController {
            let destination = segue.destination as! OurFirstViewController
            destination.passedString = (sender as! String)
        }
    }

    @IBAction private func onPushSecondScreenPressed(_ sender: Any) {
        let textToPass = textField.text
        performSegue(withIdentifier: segueToOurFirstViewController, sender: textToPass ?? "")
    }
    
}

