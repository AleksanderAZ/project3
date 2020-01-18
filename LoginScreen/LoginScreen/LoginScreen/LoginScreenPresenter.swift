//
//  LoginScreenPresenter.swift
//  LoginScreen
//
//  Created Z on 1/16/20.
//  Copyright © 2020 Zyma. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class LoginScreenPresenter: LoginScreenPresenterProtocol {

    weak private var view: LoginScreenViewProtocol?
    var interactor: LoginScreenInteractorProtocol?
    private let router: LoginScreenWireframeProtocol
    
    let loginScreenModel = LoginScreenModel()
    
    init(interface: LoginScreenViewProtocol, interactor: LoginScreenInteractorProtocol?, router: LoginScreenWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    // MARK: previous common check login and password
    func checkAll(str: String, maxCount: Int)->Bool {
        let count = str.count
        
        guard (count >= 5 && count <= maxCount) else {
            return false
        }
        
        for char in RequestsDataAPI.restrict_characters {
            if str.contains(char) {
                return false
            }
        }
        
        return true
    }
    // MARK: check login
    func checkLogin(login: String)->Bool {
        loginScreenModel.flagChechLogin = false
        loginScreenModel.login = ""
        guard checkAll(str: login, maxCount: 25) else {
            return false
        }
        
        guard login.contains("@") else {
            return false
        }
        
        var loginChar = Array(login)
        var index = loginChar.lastIndex(of: ".")
        guard index != nil else {
            return false
        }
        
        while (index != nil) {
            guard (index! < loginChar.count - 2) else {
                return false
            }
            loginChar.removeLast(loginChar.count-index!)
            index = loginChar.lastIndex(of: ".")
        }
        
        loginScreenModel.flagChechLogin = true
        checkLoginButton()
        loginScreenModel.login = login
        return true
    }
    
    // MARK:  check  password
    func checkPassword(password: String)-> Bool {
        
        loginScreenModel.flagChechPassword = false
        loginScreenModel.password = ""
        
        guard checkAll(str: password, maxCount: 20) else {
            return false
        }
        
        for check in RequestsDataAPI.checkingStrings {
            var checkFlag = false
            for char in check {
                if password.contains(char) {
                    checkFlag = true
                    break
                }
            }
            guard (checkFlag) else {
                return false
            }
        }
        
        loginScreenModel.flagChechPassword = true
        checkLoginButton()
        loginScreenModel.password = password
        return true
    }
    
    // MARK:  finaly check passwor and login
    func checkLoginButton() {
        if (loginScreenModel.flagChechLogin && loginScreenModel.flagChechPassword) {
            view?.switchOnLoginButton()
        }
    }
    
    func clickLogin() {
        router.login(login: loginScreenModel.login, password: loginScreenModel.password)
    }
    

    func openLink() {
        router.openLink()
    }
}
