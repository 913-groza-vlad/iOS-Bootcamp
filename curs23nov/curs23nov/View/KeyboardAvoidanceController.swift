//
//  KeyboardAvoidanceController.swift
//  curs23nov
//
//  Created by Vlad Groza on 28.11.2023.
//

import Foundation
import UIKit

class KeyboardAvoidanceController: UIViewController {
    
    @IBOutlet private weak var bottomConstraints: NSLayoutConstraint!
    @IBOutlet private weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyboardObservers()
        textField.delegate = self
    }
    
    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onKeyboardAppeared),
            name: UIApplication.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onKeyboardDisappeared),
            name: UIApplication.keyboardWillHideNotification,
            object: nil
        )
    }
    
    
    @objc
    private func onKeyboardAppeared(_ sender: NSNotification) {
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            bottomConstraints.constant = keyboardHeight
        }
        // bottomConstraints.constant = 500
    }
    
    @objc
    private func onKeyboardDisappeared(_ sender: NSNotification) {
        bottomConstraints.constant = 0
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension KeyboardAvoidanceController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        return true
    }
}
