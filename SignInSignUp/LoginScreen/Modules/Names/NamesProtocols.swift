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
    func countCell(section: Int)->Int
    func updateName()
    func getName(section: Int, index: Int)->String
    func closeView()
    func requestName()
    func signOut()
    func deleteName(section: Int, index: Int)
    func addName(name: String)
}

//MARK: Interactor -
protocol NamesInteractorProtocol: class {
    var presenter: NamesPresenterProtocol?  { get set }
    
    func requestName()
    func deleteName(section: Int, index: Int)
    func namesCount(section: Int)->Int
    func getName(section: Int, index: Int)->String
    func addName(name: String)
}

//MARK: View -
protocol NamesViewProtocol: class {
  var presenter: NamesPresenterProtocol?  { get set }
    
  func update()
}
