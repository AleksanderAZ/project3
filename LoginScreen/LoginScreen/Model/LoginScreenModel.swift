//
//  LoginScreenModel.swift
//  LoginScreen
//
//  Created by Z on 1/18/20.
//  Copyright © 2020 Zyma. All rights reserved.
//

import Foundation

struct RequestsDataAPI {
    
    static let restrict_characters = " \"',/:;<=>?[\\]_`{|}~"
    
    static let numbers = "0123456789"
    static let lower_case = "abcdefghijklmnopqrstuvwxyz"
    static let upper_case = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    static let special_characters = "!@#$%^&*()-+"
    static let checkingStrings = [numbers, lower_case, upper_case, special_characters]
}

class LoginScreenModel {
    var flagChechLogin: Bool = false
    var flagChechPassword: Bool = false
    var login: String = ""
    var password: String = ""
}
