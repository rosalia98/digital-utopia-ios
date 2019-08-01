//
//  RegisterViewController.swift
//  ToDoList
//
//  Created by Visitor on 31/07/2019.
//  Copyright © 2019 Visitor. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var retypePasswordTextField: UITextField!
    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBAction func signup(_ sender: Any) {
        
        guard let username = self.usernameTextField.text,
            username.count > 0 else {
                showNoUsernameSuppliedError()
                return
        }
        
        if let pwd = self.passwordTextField.text,
           let retPwd = self.retypePasswordTextField.text,
           pwd.count == retPwd.count,
           pwd.count > 0,
           retPwd.count > 0,
           pwd == retPwd{
            register(username: username, password: pwd)
            
        }
        else{
            showPwdNotMatchError()
        }
        
    }
    func register(username: String, password: String){
        let params = ["username":username,"password":password]
        let url = ""
        Alamofire.request(url,
                          method: .post,
                          parameters: params,
                          encoding: JSONEncoding.default).responseJSON{
                            response  in guard let data = response.data else{
                                return
                            }
                            let string = String(data: data, encoding: .utf8)
                            debugPrint(string)
        }
    }
    
    func showNoUsernameSuppliedError(){}
    func showPwdNotMatchError(){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
