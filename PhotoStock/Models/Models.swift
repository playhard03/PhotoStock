//
//  Models.swift
//  PhotoStock
//
//  Created by Андрей Сергеевич on 20.03.2023.
//

import Foundation
import UIKit

enum LogPassword: String{
    case login = "Name"
    case password = "12345"
}

class Models: Codable {
    var name : [String]?
    var isLiked: Bool?
    var images : [UIImage]?

    init(name: [String], image: [UIImage]){
        self.name = name
        self.images = image
       
}

enum CodingKeys: String, CodingKey {
    case name, isLiked
}

required public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.name = try container.decode([String].self, forKey: .name)
    self.isLiked = try container.decodeIfPresent(Bool.self, forKey: .isLiked)
}

public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    
    try container.encode(self.name, forKey: .name)
    try container.encode(self.isLiked, forKey: .isLiked)
}

}


