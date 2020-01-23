//
//  LoginScreenProtocols.swift
//  LoginScreen
//
//  Created Z on 1/16/20.
//  Copyright © 2020 Zyma. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol LoginScreenWireframeProtocol: class {
    func login(login: String, password: String)
    func openLink()
}
//MARK: Presenter -
protocol LoginScreenPresenterProtocol: class {
    func setPassword(password: String)
    func setLogin(login: String)
    func isHidePassword()-> Bool
    func changeHidePassword()->String
    func getPasswordForShow()->String
    func clickLogin()
    func openLink()
}

//MARK: Interactor -
protocol LoginScreenInteractorProtocol: class {

    var presenter: LoginScreenPresenterProtocol?  { get set }
    
    func getStatusLogin()->Bool
    func getStatusPassword()->Bool
    func setLogin(login: String)
    func setPassword(password: String)
    func getPassword()->String
    func getLogin()->String
}

//MARK: View -
protocol LoginScreenViewProtocol: class {
    
    var presenter: LoginScreenPresenterProtocol?  { get set }
    func setTittlePasswordButton(tittle: String)
    func switchOnLoginButton()
    func switchOnPasswordTextFild()
    func switchOffLoginButton()
    func switchOffPasswordTextFild()
}
