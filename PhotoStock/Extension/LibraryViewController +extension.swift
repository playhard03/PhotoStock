//
//  LibraryViewController +extension.swift
//  PhotoStock
//
//  Created by Андрей Сергеевич on 27.03.2023.
//

import Foundation
import UIKit

extension LibraryViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            view.endEditing(true)
            return true
    }
            
        func registerForKeyboardNotifications() {
                    NotificationCenter.default.addObserver(self, selector:
        #selector(keyboardWillShow(_:)), name:
        UIResponder.keyboardWillShowNotification, object: nil)
                    NotificationCenter.default.addObserver(self, selector:
        #selector(keyboardWillShow(_:)), name:
        UIResponder.keyboardWillHideNotification, object: nil)
            }
            
        @objc private func keyboardWillShow(_ notification: NSNotification) {
            guard let userInfo = notification.userInfo, let animationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as?
        NSNumber)?.doubleValue,
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
                    
        if notification.name == UIResponder.keyboardWillHideNotification {
                            bottomConstraint.constant = 0
                    } else {
                            bottomConstraint.constant =
        keyboardScreenEndFrame.height + 55
                    }
                    
                    view.needsUpdateConstraints()
                    UIView.animate(withDuration: animationDuration) {
                            self.view.layoutIfNeeded()
                    }
            }
}
