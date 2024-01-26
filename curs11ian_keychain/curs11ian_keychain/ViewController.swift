//
//  ViewController.swift
//  curs11ian_keychain
//
//  Created by Vlad Groza on 11.01.2024.
//

import UIKit

class ViewModel {
    private let keychainWrapper = KeychainWrapper.shared
    
    func onSignInPressed(token: String, rememberToken: Bool) {
        print("signing in...")
        
        if rememberToken {
            keychainWrapper.setString(key: .token, value: token)
        }
    }
    
    func getToken() -> String? {
        keychainWrapper.getString(key: .token)
    }
}

class ViewController: UIViewController {
    
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var `switch`: UISwitch!
    
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let token = viewModel.getToken() {
            textField.text = token
        }
    }

    @IBAction private func onSignInPressed(_ sender: Any) {
        viewModel.onSignInPressed(token: textField.text!, rememberToken: `switch`.isOn)
    }
}

