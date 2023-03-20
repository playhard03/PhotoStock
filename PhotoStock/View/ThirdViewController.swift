//
//  ThirdViewController.swift
//  PhotoStock
//
//  Created by Андрей Сергеевич on 20.03.2023.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    @IBAction func addButton(_ sender: Any) {
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
