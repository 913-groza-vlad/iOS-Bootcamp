//
//  KeychainWrapper.swift
//  curs11ian_keychain
//
//  Created by Vlad Groza on 11.01.2024.
//

import Foundation
import KeychainAccess

enum KeychainKey: String {
    case token
}

class KeychainWrapper {
    static let shared = KeychainWrapper()
    
    private init() {}
    
    let keychain = Keychain(service: "ro.betfair.curs20")
    
    func getString(key: KeychainKey) -> String? {
        return keychain[key.rawValue]
    }
    
    func setString(key: KeychainKey, value: String) {
        keychain[key.rawValue] = value
    }
}
