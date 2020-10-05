//
//  CategoriesData.swift
//  BlackStarWear
//
//  Created by Дарья on 29.09.2020.
//

import Foundation

class Subcategories {
    let id: String?
    let name: String?
    let iconImage: String?
    
    init?(data: NSDictionary){
        
        guard let id = data["id"] as? String?,
              let name = data["name"] as? String?,
              let iconImage = data["iconImage"] as? String?
        else {return nil}
        
        self.id = id
        self.name = name
        self.iconImage = iconImage
              
    }
}

class CategoriesData {
    let name: String
    let sortOrder: Int
    let imageURL: String
    let subcategories: [Subcategories]?
    
    init?(data: NSDictionary){
        
        guard let name = data["name"] as? String,
            let sortOrder = data["sortOrder"] as? String,
            let imageURL = data["image"] as? String,
            let subcategories = Subcategories(data: data)
        else { return nil }
        
        self.name = name
        self.sortOrder = Int(sortOrder) ?? 0
        self.imageURL = imageURL
        self.subcategories = [subcategories]
    }
}

