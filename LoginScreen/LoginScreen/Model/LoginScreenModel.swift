//
//  LoginScreenModel.swift
//  LoginScreen
//
//  Created by Z on 1/18/20.
//  Copyright © 2020 Zyma. All rights reserved.
//

import Foundation


struct CharactersChecking {
    
    static let restrict_characters = " ”\"'’,/:;<=>?[\\]_`{|}~"
    static let charHidePassword: Character = "●"
    static let numbers = "0123456789"
    static let lower_case = "abcdefghijklmnopqrstuvwxyz"
    static let upper_case = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    static let special_characters = "!@#$%^&*()-+"
    static let checkingStrings = [numbers, lower_case, upper_case, special_characters]
}

enum Check: Equatable {
    case yes
    case no (String)
}

class LoginScreenModel {
    var flagChechLogin: Bool = false
    var flagChechPassword: Bool = false
    var checkLogin: Check = Check.no("")
    var checkPassword: Check = Check.no("")
    var login: String = ""
    var password: String = ""
}
