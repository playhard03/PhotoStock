//
//  LibraryViewController.swift
//  PhotoStock
//
//  Created by Андрей Сергеевич on 20.03.2023.
//

import UIKit

class LibraryViewController: UIViewController {
    
    //MARK: - IBoutlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomTextField: UITextField!
    
    //MARK: - let/var
    var index = 0
    var selectedImage: UIImage?
    private enum Direction{
        case left, right
        
    }
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image =  loadImage(fileName: Manager.shared.models[index].image)
        bottomTextField.text = Manager.shared.models[index].comment
        registerForKeyboardNotifications()
        imageView.image = selectedImage
    }
    
    //MARK: - IBAction
    @IBAction func leftButton(_ sender: Any) {
        buttonPreessed(direection: .left)
    }
    
    @IBAction func rightButton(_ sender: Any) {
        buttonPreessed(direection: .right)

    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - func flow
    private func buttonPreessed(direection: Direction){
        switch direection{
        case .left:
            index = index == 0 ? Manager.shared.models.count - 1 : index - 1
        case .right:
            index = index == Manager.shared.models.count - 1 ? 0 : index + 1
        }
        
        let image = loadImage(fileName: Manager.shared.models[index].image) ?? UIImage()
        imageView.image = image
        bottomTextField.text = Manager.shared.models[index].comment
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
