//
//  ProductData.swift
//  BlackStarWear
//
//  Created by Дарья on 09.10.2020.
//

import Foundation

class ProductData{
    let name: String
    let sortOrder: Int
    let description: String
    let mainImage: String //  главная фотка
    let colorName: String
    let price: String
    var productImages: [ProductImages] // array with dict
    var offers: [Offers] // array with dict
    
    init?(data: NSDictionary){
        
        guard let name = data["name"] as? String,
              let sortOrder = data["sortOrder"] as? String,
              let description = data["description"] as? String,
              let mainImage = data["mainImage"] as? String,
              let colorName = data["colorName"] as? String,
              let price = data["price"] as? String,
              let offersNS = data["offers"] as? NSArray,
              let productImagesNS = data["productImages"] as? NSArray
        else { return nil }
        
        self.name = name
        self.sortOrder = Int(sortOrder) ?? 0
        self.description = description
        self.mainImage = mainImage
        self.colorName = colorName
        self.price = price
        
        self.offers = []
        self.productImages = []
        
        for data in offersNS where data is NSDictionary{
            if let offer = Offers(data: data as! NSDictionary){
                self.offers.append(offer)
            }
        }
        
        for data in productImagesNS where data is NSDictionary{
            if let product = ProductImages(data: data as! NSDictionary){
                self.productImages.append(product)
            }
        }
    }
    
}

class ProductImages {
    let imageURL: String
    let sortOrder: Int
    
    init?(data: NSDictionary){
        
        guard let imageURL = data["imageURL"] as? String,
              let sortOrder = data["sortOrder"] as? String
        else {return nil}
        
        self.imageURL = imageURL
        self.sortOrder = Int(sortOrder) ?? 0
    }
    
    
}

class Offers{
    let size: String
    let quantity: String // колличесиво
    
    init?(data: NSDictionary){
        
        guard let size = data["size"] as? String,
              let quantity = data["quantity"] as? String
        else {return nil}
        
        self.size = size
        self.quantity = quantity
    }
    
}
