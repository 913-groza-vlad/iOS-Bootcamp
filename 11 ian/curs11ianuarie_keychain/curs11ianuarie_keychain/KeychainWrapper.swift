//
//  KeychainWrapper.swift
//  curs11ianuarie_keychain
//
//  Created by Orlando Neacsu on 11.01.2024.
//

import Foundation
import KeychainAccess

enum KeychainKey: String {
    case token
}

class KeychainWrapper {
    
    static let instance = KeychainWrapper()
    private init() {}
    
    let keychain = Keychain(service: "ro.betfair.curs20")
    
    func getString(key: KeychainKey) -> String? {
        return keychain[key.rawValue]
    }
    
    func setString(key: KeychainKey, value: String) {
        keychain[key.rawValue] = value
    }
    
    
}
