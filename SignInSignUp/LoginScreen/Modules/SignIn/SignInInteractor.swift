//
//  SignInInteractor.swift
//  SignIn
//
//  Created Oleksander on 14.03.2020.
//  Copyright © 2020 Zyma. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class SignInInteractor: SignInInteractorProtocol {

    weak var presenter: SignInPresenterProtocol?
    
    let signInModel = LoginModel()
    
    var statusHidePassword: Bool = true
    
    func isHidePassword()-> Bool {
        return statusHidePassword
    }
    
    func changeStatusHidePassword() {
        statusHidePassword = !statusHidePassword
    }
    
    func setLogin(login: String) {
        signInModel.login = login
        if login == "" {
            setPassword(password: "")
        }
        else {
            signInModel.checkLogin = checkLogin(login: signInModel.login)
        }
    }
    
    func getLogin()->String {
        return signInModel.login
    }
    
    func getStatusCheckLogin()->Check {
        return signInModel.checkLogin
    }
    
    func setPassword(password: String) {
        var passwordNew = password
        if (isHidePassword()) {
            let password = getPassword()
            passwordNew = changeHidePassword(password: password, passwordHide: passwordNew)
        }
        signInModel.password = passwordNew
        signInModel.checkPassword = checkPassword(password: signInModel.password)
    }
    
    func getPassword()->String {
        return signInModel.password
    }
    
    func getPasswordForShow()->String {
        let password = getPassword()
        if (isHidePassword()) {
            return String(repeating: CharactersChecking.charHidePassword, count: password.count)
        }
        else {
            return password
        }
    }
    
    func getStatusCheckPassword()->Check {
        return signInModel.checkPassword
    }
    
    // MARK: previous common check login and password
    func checkAll(str: String, maxCount: Int)->Check {
        let count = str.count
        guard (count >= 5 && count <= maxCount) else {
            return Check.no("Characters number must >4 and <\(maxCount)")
        }
        for char in CharactersChecking.restrict_characters {
            if str.contains(char) {
                return Check.no("Restricted characters - \"\(char)\"")
            }
        }
        return Check.yes
    }
    
    func checkLogin(login: String)->Check {
        let check: Check
        check = checkAll(str: login, maxCount: 25)
        guard check == .yes else {
            return check
        }
        guard login.contains("@") else {
            return Check.no("Login must contains - \"@\"")
        }
        var loginChar = Array(login)
        var index = loginChar.lastIndex(of: ".")
        guard index != nil else {
            return Check.no("Login must contains - \".\"")
        }
        while (index != nil) {
            guard (index! < loginChar.count - 2) else {
                return Check.no("Login must contains 2 characters after \".\"")
            }
            loginChar.removeLast(loginChar.count-index!)
            index = loginChar.lastIndex(of: ".")
        }
        return Check.yes
    }
    
    func checkPassword(password: String)->Check {
        let check: Check
        check = checkAll(str: password, maxCount: 20)
        guard check == .yes else {
            return check
        }
        
        for check in CharactersChecking.checkingStrings {
            var checkFlag = false
            for char in check {
                if password.contains(char) {
                    checkFlag = true
                    break
                }
            }
            guard (checkFlag) else {
                return Check.no("Password must contains - number, latin characters lowercase and uppercase, special character")
            }
        }
        return Check.yes
    }
    
    func changeHidePassword(password: String, passwordHide: String)->String {
        var password = password
        guard (passwordHide.count > 0) else { return ""}
        guard (passwordHide.count >= password.count) else { return "" }
        guard (passwordHide.count > password.count) else { return password }
        guard let _ = passwordHide.lastIndex(where: {$0 != CharactersChecking.charHidePassword}) else { return "" }
        var newPassword = ""
        for char in passwordHide {
            if (char == CharactersChecking.charHidePassword) {
                newPassword.append(password.removeFirst())
            }
            else {
                newPassword.append(char)
            }
        }
        return newPassword
    }

    func chackSignin() -> Bool {
        let signDictionry = ReadServise.getUserDef()
        
        guard let password = signDictionry[signInModel.login] else { return false }
        if password == signInModel.password {
            return  true
        }
        return  false
    }
}
