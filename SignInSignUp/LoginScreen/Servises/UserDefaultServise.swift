//
//  UserDefaultServise.swift
//  LoginScreen
//
//  Created by Oleksander on 24.03.2020.
//  Copyright © 2020 Zyma. All rights reserved.
//

import Foundation

struct Key: RawRepresentable {
    let rawValue: String
}

extension Key: ExpressibleByStringLiteral {
    init(stringLiteral: String) {
        rawValue = stringLiteral
    }
}

extension Key {
    static let userSign: Key = "userSign"
}

protocol PropertyListValue {}
extension String: PropertyListValue {}
extension Data: PropertyListValue {}
extension Dictionary: PropertyListValue where Key == String, Value: PropertyListValue {}
extension Array: PropertyListValue where Element: PropertyListValue {}

struct SignUserDefault<T: PropertyListValue> {
    let key: Key
    private let userDef = UserDefaults.standard
    init(key: Key){
        self.key = key
    }
    
    var wrappedValue: T? {
        get { return userDef.value(forKey: key.rawValue) as? T }
        set { userDef.set(newValue, forKey: key.rawValue) }
    }
}

struct SignStorage {
    var signUserDefault = SignUserDefault<[String: String]>(key: Key.userSign)
}

