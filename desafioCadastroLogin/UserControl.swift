//
//  UserControl.swift
//  desafioCadastroLogin
//
//  Created by Cesar A. Tavares on 9/16/20.
//  Copyright © 2020 Cesar A. Tavares. All rights reserved.
//

import Foundation

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
