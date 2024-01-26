//
//  UserDefaultsManager.swift
//  curs11ianuarie-userdefaults
//
//  Created by Orlando Neacsu on 11.01.2024.
//

import Foundation

enum UserDefaultsKeys: String {
    case lastButtonPressedText
    case lastButtonPressedIndex
    case auxKey
}


class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    private let userDefaults = UserDefaults.standard
    
    // private let customUserDefaults = UserDefaults(suiteName: "custom_user_defaults")
    
    private init() {}
    
    func set(key: UserDefaultsKeys, value: Any?) {
        userDefaults.setValue(value, forKey: key.rawValue)
    }
    
    func delete(key: UserDefaultsKeys) {
        userDefaults.setValue(nil, forKey: key.rawValue)
    }
    
    func getString(key: UserDefaultsKeys) -> String? {
        userDefaults.string(forKey: key.rawValue)
    }
    
    func getBool(key: UserDefaultsKeys) -> Bool? {
        userDefaults.bool(forKey: key.rawValue)
    }
    
    func getInteger(key: UserDefaultsKeys) -> Int {
        userDefaults.integer(forKey: key.rawValue)
    }
    
    func getArray(key: UserDefaultsKeys) -> [Any?]? {
        userDefaults.array(forKey: key.rawValue)
    }
    
    func getData(key: UserDefaultsKeys) -> Data? {
        userDefaults.data(forKey: key.rawValue)
    }
    
    func getDictionary(key: UserDefaultsKeys) -> [String: Any?]? {
        userDefaults.dictionary(forKey: key.rawValue)
    }
    
    func getUrl(key: UserDefaultsKeys) -> URL? {
        userDefaults.url(forKey: key.rawValue)
    }
    
    func getDouble(key: UserDefaultsKeys) -> Double? {
        userDefaults.double(forKey: key.rawValue)
    }
    
    func getFloat(key: UserDefaultsKeys) -> Float {
        userDefaults.float(forKey: key.rawValue)
    }
    
    
}
