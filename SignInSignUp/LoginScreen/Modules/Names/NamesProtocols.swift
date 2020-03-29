//
//  NamesProtocols.swift
//  LoginScreen
//
//  Created Z on 11/6/19.
//  Copyright © 2019 Zyma. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol NamesWireframeProtocol: class {
    func closeView()
}
//MARK: Presenter -
protocol NamesPresenterProtocol: class {
    func countCell()->Int
    func updateName(resultName: [NamesModel]?)
    func getName(index: Int)->String
    func closeView()
    func getNameModel(index: Int)->NamesModel?
    func requestName()
    func signOut()
}

//MARK: Interactor -
protocol NamesInteractorProtocol: class {
    var presenter: NamesPresenterProtocol?  { get set }
    
    func requestName()
}

//MARK: View -
protocol NamesViewProtocol: class {
  var presenter: NamesPresenterProtocol?  { get set }
    
  func update()
}
