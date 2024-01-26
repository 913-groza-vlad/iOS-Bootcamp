//
//  UserDefaultsManager.swift
//  curs11ian_userDefaults
//
//  Created by Vlad Groza on 11.01.2024.
//

import Foundation

enum UserDefaultsKeys: String {
    case lastButtonPressedText
    case lastButtonPressedIndex
    case lastButtonPressedArray
    case auxKey
}

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private let userDefaults = UserDefaults(suiteName: "my_custom_user_defaults")
    
    private init() {}
    
    func set(key: UserDefaultsKeys, value: Any?) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
    
    func getString(key: UserDefaultsKeys) -> String? {
        UserDefaults.standard.string(forKey: key.rawValue)
    }
    
    func delete(key: UserDefaultsKeys) {
        UserDefaults.standard.setValue(nil, forKey: key.rawValue)
    }
    
    func getBool(key: UserDefaultsKeys) -> Bool? {
        UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
    func getInteger(key: UserDefaultsKeys) -> Int? {
        UserDefaults.standard.integer(forKey: key.rawValue)
    }
    
    func getArray(key: UserDefaultsKeys) -> [Any?]? {
        UserDefaults.standard.array(forKey: key.rawValue)
    }
    
    func getData(key: UserDefaultsKeys) -> Data? {
        UserDefaults.standard.data(forKey: key.rawValue)
    }
    
    func getDictionary(key: UserDefaultsKeys) -> [String: Any?]? {
        UserDefaults.standard.dictionary(forKey: key.rawValue)
    }
    
    func getUrl(key: UserDefaultsKeys) -> URL? {
        UserDefaults.standard.url(forKey: key.rawValue)
    }
    
    func getDouble(key: UserDefaultsKeys) -> Double? {
        UserDefaults.standard.double(forKey: key.rawValue)
    }
    
    func getFloat(key: UserDefaultsKeys) -> Float? {
        UserDefaults.standard.float(forKey: key.rawValue)
    }
    
}
