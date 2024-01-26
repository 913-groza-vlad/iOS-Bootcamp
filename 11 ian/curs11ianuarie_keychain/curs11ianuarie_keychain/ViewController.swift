//
//  ViewController.swift
//  curs11ianuarie_keychain
//
//  Created by Orlando Neacsu on 11.01.2024.
//

import UIKit

class ViewModel {
    
    private let keychainWrapper = KeychainWrapper.instance
    
    func onSignInPressed(token: String, rememberToken: Bool) {
        
        if rememberToken {
            keychainWrapper.setString(key: .token, value: token)
        }
        
        print("signing in...")
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
        if let token = viewModel.getToken() {
            textField.text = token
        }
    }
    
    @IBAction private func onSignInPressed(_ sender: Any) {
        viewModel.onSignInPressed(
            token: textField.text!,
            rememberToken: `switch`.isOn
        )
    }
}

