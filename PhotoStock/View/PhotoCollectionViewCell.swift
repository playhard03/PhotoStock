//
//  PhotoCollectionViewCell.swift
//  PhotoStock
//
//  Created by Андрей Сергеевич on 07.04.2023.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
   
    func configure(with index: Int) {
        let image = loadImage(fileName: Manager.shared.models[index].image) ?? UIImage()
        imageView.image = image
    }
    
    private func loadImage(fileName: String) -> UIImage? {
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let imageUrl = documentsDirectory.appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageUrl.path)
            return image
        }
        return nil
    }
}

