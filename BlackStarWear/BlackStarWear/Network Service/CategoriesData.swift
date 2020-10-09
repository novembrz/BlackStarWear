//
//  CategoriesData.swift
//  BlackStarWear
//
//  Created by Дарья on 29.09.2020.
//

import Foundation
//let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
//if let jsonDict = json as? NSDictionary{
//
//    DispatchQueue.main.async {
//        var categories: [CategoriesData] = []
//
//        for (_, data) in jsonDict where data is NSDictionary{
//            if let category = CategoriesData(data: data as! NSDictionary){
//                categories.append(category)
//            }
//        }
//        completion(categories)
//    }
//}
class CategoriesData {
    
    let name: String
    let sortOrder: Int
    let imageURL: String
    var subcategories: [Subcategories]
    
    init?(data: NSDictionary){
        
        guard let name = data["name"] as? String,
            let sortOrder = data["sortOrder"] as? String,
            let imageURL = data["image"] as? String,
            let subcategoriesNS = data["subcategories"] as? NSArray
        else { return nil }
        
        self.name = name
        self.sortOrder = Int(sortOrder) ?? 0
        self.imageURL = imageURL
            
        self.subcategories = []
        
        for data in subcategoriesNS where data is NSDictionary{
            if let sub = Subcategories(data: data as! NSDictionary){
                self.subcategories.append(sub)
            }
        }
    }
}

class Subcategories {
    
    let id: String
    let name: String
    let iconImage: String?
    
    init?(data: NSDictionary){

        guard let id = data["id"] as? String,
              let name = data["name"] as? String,
              let iconImage = data["iconImage"] as? String?
        else {return nil}

        self.id = id
        self.name = name
        self.iconImage = iconImage

    }
}


