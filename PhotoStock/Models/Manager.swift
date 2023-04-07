//
//  Manager.swift
//  PhotoStock
//
//  Created by Андрей Сергеевич on 07.04.2023.
//

import Foundation

class Manager{
    static let shared = Manager()
    
    private init(){}
    
    var models:[Models] {
        get{
            let array = UserDefaults.standard.value([Models].self,
                                                    forKey: Keys.photo.rawValue) ?? [Models]()
            return array
        }
        set{
            UserDefaults.standard.setValue(encodable: newValue, forKey: Keys.photo.rawValue)
        }
    }
    
    func updateDefaults(array:[Models]) {
        UserDefaults.standard.setValue(encodable: array, forKey: Keys.photo.rawValue)
    }
}
