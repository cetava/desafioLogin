//
//  UITextFieldExtension.swift
//  desafioCadastroLogin
//
//  Created by Cesar A. Tavares on 9/16/20.
//  Copyright © 2020 Cesar A. Tavares. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func isEmpty() -> Bool {
        if text == nil || text!.isEmpty {
            return true
        }
        
        return false
    }
}
