//
//  SaveServise.swift
//  LoginScreen
//
//  Created by Oleksander on 24.03.2020.
//  Copyright © 2020 Zyma. All rights reserved.
//

import Foundation

class SaveServise {
    
    private init() { }
    
    static func saveUserDef(_ signUser: [String: String]) {
        var signStorage = SignStorage()

        signStorage.signUserDefault.wrappedValue = signUser
    }
}
