//
//  LibraryViewController.swift
//  PhotoStock
//
//  Created by Андрей Сергеевич on 20.03.2023.
//

import UIKit

class LibraryViewController: UIViewController {
    
    //MARK: - IBoutlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var modelsArray : [Models]?
    var current = 0
    var capacity = 1
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefault() 
    }
    
    //MARK: - IBAction
    @IBAction func leftButton(_ sender: Any) {
        
    }
    
    @IBAction func rightButton(_ sender: Any) {
        updateData()
        
        current = current < capacity - 1 ? current + 1 : 0
        guard capacity > 1 else {return}
        guard let models = modelsArray else {return}
        
        let mod = models[current]
        guard let image = loadImage(fileName: mod.image) else {return}
        textField.text = mod.comment
        imageView.image = image

    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    private func loadImage(fileName: String) -> UIImage? {
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let imageUrl = documentsDirectory.appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageUrl.path)
            return image
        }
        return nil
    }
    
    private func updateData() {
        guard let models = modelsArray?[current] else {return}
        guard let text = textField.text else {return}
        models.comment = text
        UserDefaults.standard.setValue(encodable: modelsArray, forKey: Keys.photo.rawValue)
    }
    
    private func loadDefault() {
        if let models = UserDefaults.standard.value([Models].self, forKey: Keys.photo.rawValue){
            modelsArray = models
            capacity = models.count
            guard let model = models.first else {return}
            
            textField.text = model.comment
            let imageName = model.image
            guard let image = loadImage(fileName: imageName) else {return}
            imageView.image = image
                    
        } else {
            capacity = 0
        }
        
    }
    
    
}
