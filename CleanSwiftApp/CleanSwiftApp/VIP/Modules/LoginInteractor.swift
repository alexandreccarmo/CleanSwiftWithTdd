//
//  LoginInteractor.swift
//  CleanSwiftApp
//
//  Created by Alexandre C do Carmo on 14/06/21.
//

import Foundation

protocol LoginInteractorProtocol {
    func login(email: String, password: String)
}

class LoginInteractor : LoginInteractorProtocol {
    private let loginWorker: LoginWorkerProtocol
    var presenter: LoginPresenterProtocol?
    
    required init(withLoginWorker loginWorker: LoginWorkerProtocol) {
        self.loginWorker = loginWorker
    }
    
    func login(email: String, password: String) {
        loginWorker.login(email: email, password: password) { [unowned self] (callback) in
            switch callback {
            case .success(let result):
                self.presenter?.interactor(self, didfetch: result)
            break;
            
            case .failure(let error):
                self.presenter?.interactor(self, didFailWith: error)
            break;
        }
        }
    }
}
