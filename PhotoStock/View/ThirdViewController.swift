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
        
        
        let recongize = UITapGestureRecognizer(target: self, action: #selector(addImage))
        view.addGestureRecognizer(recongize)
    }
    
    @IBAction func addButton(_ sender: Any) {
        guard let image = imageView.image else {return}
        guard let text = textField.text else {return}
        guard let saveImage = saveImage(image: image) else {return}
        
        let models = Models(image: saveImage, comment: text)
        
        if let array = UserDefaults.standard.value([Models].self, forKey: Keys.photo.rawValue){
            var tempArray = array
            tempArray.append(models)
            UserDefaults.standard.setValue(encodable: tempArray, forKey: Keys.photo.rawValue)
        } else {
            let array : [Models] = [models]
            UserDefaults.standard.setValue(encodable: array, forKey: Keys.photo.rawValue)
        }
                
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


