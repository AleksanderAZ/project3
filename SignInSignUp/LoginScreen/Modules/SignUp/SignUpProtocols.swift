//
//  SignUpProtocols.swift
//  LoginScreen
//
//  Created Oleksander on 14.03.2020.
//  Copyright © 2020 Zyma. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol SignUpWireframeProtocol: class {

}
//MARK: Presenter -
protocol SignUpPresenterProtocol: class {

}

//MARK: Interactor -
protocol SignUpInteractorProtocol: class {

  var presenter: SignUpPresenterProtocol?  { get set }
}

//MARK: View -
protocol SignUpViewProtocol: class {

  var presenter: SignUpPresenterProtocol?  { get set }
}