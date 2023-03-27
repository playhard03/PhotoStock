//
//  ThirdViewController +extension.swift
//  PhotoStock
//
//  Created by Андрей Сергеевич on 20.03.2023.
//

import Foundation
import UIKit

extension ThirdViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var chooseImage = UIImage()
        
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            chooseImage = image
        } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            chooseImage = image
        }
        imageView.image = chooseImage
        
        picker.dismiss(animated: true)
    }
   
    
    
}
