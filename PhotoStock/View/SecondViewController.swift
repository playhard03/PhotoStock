//
//  SecondViewController.swift
//  PhotoStock
//
//  Created by Андрей Сергеевич on 20.03.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var modelsArray : [Models]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.reloadData()
    }
    
    @IBAction func addPhotoButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func libraryButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "LibraryViewController") as? LibraryViewController else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        self.collectionView.reloadData()
    }
}

extension SecondViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ThirdViewControllerDelegate {
    
    func reload() {
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Manager.shared.models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as? PhotoCollectionViewCell else {return UICollectionViewCell() }
        cell.configure(with: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = (collectionView.frame.size.width - 16) / 2
        return CGSize(width: side, height: side)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "LibraryViewController") as? LibraryViewController else {return}
        navigationController?.pushViewController(vc, animated: true)
        let selectedImage = loadImage(fileName: Manager.shared.models[indexPath.row].image)
        vc.selectedImage = selectedImage
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



