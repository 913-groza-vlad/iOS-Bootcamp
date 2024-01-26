//
//  ThirdViewController.swift
//  curs2-1
//
//  Created by Vlad Groza on 16.11.2023.
//

import UIKit

class ThirdViewController: UIViewController {

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
    @IBAction private func onBackPressed(_ sender: Any) {
        if let navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    
    @IBAction private func onBackToRootPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: false)
    }
}
