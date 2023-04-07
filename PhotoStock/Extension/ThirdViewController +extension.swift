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
