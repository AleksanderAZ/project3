//
//  CharactersChecking.swift
//  LoginScreen
//
//  Created by Oleksander on 24.03.2020.
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
