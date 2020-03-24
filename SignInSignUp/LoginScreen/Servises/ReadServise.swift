//
//  ReadServise.swift
//  LoginScreen
//
//  Created by Oleksander on 24.03.2020.
//  Copyright © 2020 Zyma. All rights reserved.
//

import Foundation

class ReadServise {
    
    private init() {}
    
    static func getUserDef()->[String: String] {
        let signStorage = SignStorage()
        
        guard let saveDictionery = signStorage.signUserDefault.wrappedValue else { return [String: String]() }

        return saveDictionery
    }
}

