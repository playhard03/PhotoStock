//
//  SecondViewController.swift
//  PhotoStock
//
//  Created by Андрей Сергеевич on 20.03.2023.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addPhotoButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func libraryButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "LibraryViewController") as? LibraryViewController else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
