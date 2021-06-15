//
//  ClassConfiguration.swift
//  CleanSwiftApp
//
//  Created by Alexandre C do Carmo on 14/06/21.
//

import Foundation

class ClassConfiguration: NSObject {
    
    class func loginModule(configure viewController: LoginViewProtocol){
        //MARK: Initialise components.
        let interactor = LoginInteractor(withLoginWorker: LoginWorker())
        let presenter = LoginPresenter()

        //MARK: link VIP components.
        viewController.interector = interactor
        interactor.presenter = presenter
        presenter.view = viewController
    }
}
