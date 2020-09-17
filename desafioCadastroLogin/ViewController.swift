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
                    alert(mensagem: "Usuário logado!")
                } else {
                    alert(mensagem: "Login ou Senha incorreta!")
                }
            } else {
                alert(mensagem: "Login ou Senha incorreta!")
            }
        }
    }
    
    @IBAction func buttonCadastrar(_ sender: Any) {
        let userCadastrar = User(login: textFieldLogin.text!, password: textFieldSenha.text!)
        if validateFields() {
            if userControl.checkUser(usuario: userCadastrar) {
                alert(mensagem: "Usuário já cadastrado!")
            } else {
                userControl.addUser(user: userCadastrar)
                alert(mensagem: "Usuário cadastrado!")
                clearFields()
            }
        }
        
        
    }
    
    func validateFields() -> Bool{
        if textFieldLogin.isEmpty() || textFieldSenha.isEmpty() {
            return false
        } else {
            return true
        }
    }
    
    func alert (mensagem: String) {
            let alert = UIAlertController(title: "Atenção", message: mensagem, preferredStyle: .alert)

            let okAction = UIAlertAction(title: "OK", style: .cancel) { (UIAlertAction) in
            }
            alert.addAction(okAction)
            self.present(alert, animated: true) {

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
            if textFieldLogin.isEmpty()  {
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
