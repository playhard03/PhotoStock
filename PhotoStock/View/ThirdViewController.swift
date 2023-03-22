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
    var images = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let recongize = UITapGestureRecognizer(target: self, action: #selector(addImage))
        view.addGestureRecognizer(recongize)
    }
    
    @IBAction func addButton(_ sender: Any) {
        let models = Models(name: textField.text!)
        UserDefaults.standard.setValue(encodable: models, forKey: "name")
        
        if let image = imageView.image {
            let imageName = saveImage(image: image)
            UserDefaults.standard.setValue(imageName, forKey: "image")
        }
        textField.text = nil
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc func addImage(){
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
        
    }
    
    func saveImage(image: UIImage) -> String?{
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        
        let fileName = UUID().uuidString
        let fileUrl = documentDirectory.appendingPathComponent(fileName)
        guard let data  = image.jpegData(compressionQuality: 1) else {return nil}
        
        if FileManager.default.fileExists(atPath: fileUrl.path){
            do {
                try FileManager.default.removeItem(atPath: fileUrl.path)
                print("Delete old picture")
            } catch let error {
                print("Error \(error)")
            }
        }
        
        do {
            try data.write(to: fileUrl)
            return fileName
        }catch let error {
            print("Error \(error)")
            return nil
        }
    }
    
   
}


