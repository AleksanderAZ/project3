//
//  LoginScreenRouter.swift
//  LoginScreen
//
//  Created Z on 1/16/20.
//  Copyright © 2020 Zyma. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class LoginScreenRouter: LoginScreenWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(title: String) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = LoginScreenViewController(nibName: nil, bundle: nil)
        let interactor = LoginScreenInteractor()
        let router = LoginScreenRouter()
        let presenter = LoginScreenPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        view.navigationItem.title = title
        
        return view
    }
}
