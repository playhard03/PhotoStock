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
enum Keys : String {
    case pass
    case photo
}

class Models: Codable {
    var image : String
    var comment : String
    var array = [String]()
    
    init(image: String, comment: String){
        self.image = image
        self.comment = comment
}
    
enum CodingKeys: String, CodingKey {
    case image, isLiked, comment
}

required public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.image = try container.decode(String.self, forKey: .image)
    self.comment = try container.decode(String.self, forKey: .comment)
}

public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    
    try container.encode(self.image, forKey: .image)
    try container.encode(self.comment, forKey: .comment)
}

}


