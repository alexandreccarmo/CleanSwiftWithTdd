//
//  LoginPresenter.swift
//  CleanSwiftApp
//
//  Created by Alexandre C do Carmo on 14/06/21.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    func interactor(_ interactor: LoginInteractorProtocol, didfetch object: LoginEntity.Response)
    func interactor(_ interactor: LoginInteractorProtocol, didFailWith object: NSError)
}
class LoginPresenter: LoginPresenterProtocol {
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorProtocol?
    
    func interactor(_ interactor: LoginInteractorProtocol, didfetch object: LoginEntity.Response) {
        let viewModel = LoginEntity.ViewModel(email: object.email, firstName: object.firstName, lastName: object.lastName, mobileNum: object.mobileNumber)
        
        view?.set(viewModel: viewModel)
        
    }
    
    func interactor(_ interactor: LoginInteractorProtocol, didFailWith object: NSError) {
        // Error handling.
    }
}
