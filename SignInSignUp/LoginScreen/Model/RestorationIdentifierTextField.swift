//
//  RestorationIdentifierTextField.swift
//  LoginScreen
//
//  Created by Oleksander on 24.03.2020.
//  Copyright © 2020 Zyma. All rights reserved.
//

import Foundation

enum RestorationIdentifierTextField {
    case password
    case confirm
    case login
    
    var string: String {
        switch self {
        case .password    : return "password"
        case .confirm    : return "confirm"
        case .login    : return "login"
        }
    }
}
