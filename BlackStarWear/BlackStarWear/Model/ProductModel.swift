//
//  ProductModel.swift
//  BlackStarWear
//
//  Created by Дарья on 12.10.2020.
//

import UIKit
import RealmSwift

class ProductModel: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var price = 0.0
    @objc dynamic var size = ""
    @objc dynamic var imageData: Data?
    
    convenience init(name: String, price: Double, size: String, imageData: Data?) {
        self.init()
        self.name = name
        self.price = price
        self.size = size
        self.imageData = imageData
    }
}
