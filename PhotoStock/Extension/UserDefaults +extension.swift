//
//  UserDefaults +extension.swift
//  PhotoStock
//
//  Created by Андрей Сергеевич on 20.03.2023.
//

import Foundation

extension UserDefaults {
    func setValue<T: Encodable>(encodable: T, forKey key: String) {
        if let data =  try? JSONEncoder().encode(encodable) {
            setValue(data, forKey: key)
        }
    }
    
    func value<T: Decodable>(_ type: T.Type, forKey key: String ) -> T? {
        if let data = object(forKey: key) as? Data,
           let value = try? JSONDecoder().decode(type, from: data){
            return value
        }
        return nil
    }
}
