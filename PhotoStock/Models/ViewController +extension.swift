//
//  ViewController +extension.swift
//  PhotoStock
//
//  Created by Андрей Сергеевич on 20.03.2023.
//

import Foundation
import UIKit

extension ViewController{
     func signIn(){
        if nameTextField.text == LogPassword.login.rawValue && passwordTextField.text == LogPassword.password.rawValue {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "Неправильные логин или пароль", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default)
            alert.addAction(ok)
            present(alert, animated: true)
        }
    }
}
