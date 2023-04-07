//
//  ViewController.swift
//  PhotoStock
//
//  Created by Андрей Сергеевич on 20.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    //MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        nameTextField.text = "Name"
        passwordTextField.text = "12345"
    }
    
    //MARK: - IBAction
    
    @IBAction func signInButton(_ sender: Any) {
        signIn()
    }
    
    //MARK: - private func
    
   
}

