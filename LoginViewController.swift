//
//  LoginViewController.swift
//  ToDoList
//
//  Created by Visitor on 30/07/2019.
//  Copyright © 2019 Visitor. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func LoginButtonPressed(_ sender: UIButton) {
        
        if  let username = usernameTextField.text,
            let password = passwordTextField.text,
            username.count > 0,
            password.count>0{
            
            login(username: username,
                      password: password)
        }else{
            showInvalidCredentialsError()
        }
        
    }
    func showInvalidCredentialsError(){}
    
    func login(username: String,
                   password: String){
         let todoListViewController = self.storyboard!.instantiateViewController(withIdentifier: "TodoListViewController")
        
        self.navigationController?.pushViewController(todoListViewController, animated: true)
    
    }
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        let registerVc = self.storyboard!.instantiateViewController(withIdentifier: "RegisterViewController")
        
        self.navigationController?.pushViewController(registerVc, animated: true)
    }
}
