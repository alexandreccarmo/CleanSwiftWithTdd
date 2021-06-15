//
//  LoginViewController.swift
//  CleanSwiftApp
//
//  Created by Alexandre C do Carmo on 14/06/21.
//

import Foundation
import UIKit

protocol LoginViewProtocol: AnyObject {
    var interector: LoginInteractorProtocol? {get set}
    func set(viewModel: LoginEntity.ViewModel)
}

class LoginViewController: UIViewController, LoginViewProtocol {
    var interector: LoginInteractorProtocol?
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    required init?(coder aDecoder: NSCoder){
            super.init(coder: aDecoder)
        ClassConfiguration.loginModule(configure: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func signinButton(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            interector?.login(email: email, password: password)
        }
    }
    
    func set(viewModel: LoginEntity.ViewModel){
        print("E-mail: ", viewModel.email!)
    }
}
