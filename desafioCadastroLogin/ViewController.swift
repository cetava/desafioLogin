//
//  ViewController.swift
//  desafioCadastroLogin
//
//  Created by Cesar A. Tavares on 9/16/20.
//  Copyright © 2020 Cesar A. Tavares. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textFieldLogin: UITextField!
    @IBOutlet weak var textFieldSenha: UITextField!
    let userControl = UserControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldLogin.delegate = self
        textFieldSenha.delegate = self
        textFieldLogin.becomeFirstResponder()
    }

    @IBAction func buttonLogin(_ sender: Any) {
        let userLogin = User(login: textFieldLogin.text!, password: textFieldSenha.text!)
        if validateFields() {
            if userControl.checkUser(usuario: userLogin) {
                if userControl.checkPassword {
                    let alert = UIAlertController(title: "Atenção", message: "Usuário logado!", preferredStyle: .alert)

                    let okAction = UIAlertAction(title: "OK", style: .cancel) { (UIAlertAction) in
                    }
                    alert.addAction(okAction)
                    self.present(alert, animated: true) {
                       
                    }
                } else {
                    let alert = UIAlertController(title: "Atenção", message: "Senha incorreta!", preferredStyle: .alert)

                    let okAction = UIAlertAction(title: "OK", style: .cancel) { (UIAlertAction) in
                    }
                    alert.addAction(okAction)
                    self.present(alert, animated: true) {
                       
                    }
                }
            } else {
                let alert = UIAlertController(title: "Atenção", message: "Usuário inexistente!", preferredStyle: .alert)

                let okAction = UIAlertAction(title: "OK", style: .cancel) { (UIAlertAction) in
                }
                alert.addAction(okAction)
                self.present(alert, animated: true) {
                   
                }
            }
        }
    }
    
    @IBAction func buttonCadastrar(_ sender: Any) {
        let userCadastrar = User(login: textFieldLogin.text!, password: textFieldSenha.text!)
        if validateFields() {
            if userControl.checkUser(usuario: userCadastrar) {
                let alert = UIAlertController(title: "Atenção", message: "Usuário já cadastrado!", preferredStyle: .alert)

                let okAction = UIAlertAction(title: "OK", style: .cancel) { (UIAlertAction) in
                }
                alert.addAction(okAction)
                self.present(alert, animated: true) {
                   
                }
            } else {
                userControl.addUser(user: userCadastrar)
                let alert = UIAlertController(title: "Atenção", message: "Usuário cadastrado!", preferredStyle: .alert)

                let okAction = UIAlertAction(title: "OK", style: .cancel) { (UIAlertAction) in
                }
                alert.addAction(okAction)
                self.present(alert, animated: true) {
                   
                }
                clearFields()
            }
        }
        
        
    }
    
    func validateFields() -> Bool{
        if textFieldLogin == nil || textFieldLogin.text!.isEmpty || textFieldSenha == nil || textFieldSenha.text!.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    func clearFields() {
        textFieldLogin.text = nil
        textFieldSenha.text = nil
        textFieldLogin.becomeFirstResponder()
    }
}

extension ViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldLogin {
            if textFieldLogin != nil && !textFieldLogin.text!.isEmpty  {
                textFieldSenha.becomeFirstResponder()
            }
        } else {
            if validateFields() {
                textField.resignFirstResponder()
            }
        }
        return true
    }
}

class User {
    var login: String
    var password: String
    
    init(login: String, password: String) {
        self.login = login
        self.password = password
    }
}

class UserControl {
    var arrayUser = [User]()
    var checkLogin: Bool = false
    var checkPassword: Bool = false
    
    func addUser(user: User){
        arrayUser.append(user)
    }
    
    func checkUser(usuario: User) -> Bool {
        for item in arrayUser {
            if item.login == usuario.login {
                checkLogin = true
                if item.password == usuario.password {
                    checkPassword = true
                    return checkLogin
                } else {
                    checkPassword = false
                }
            }
        }
        return checkLogin
    }
    
}

