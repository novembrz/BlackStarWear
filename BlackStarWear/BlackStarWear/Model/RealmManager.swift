//
//  RealmManager.swift
//  BlackStarWear
//
//  Created by Дарья on 12.10.2020.
//

import RealmSwift

let realm = try! Realm()

class RealmManager {
    
    static var productsList: Results<ProductModel> {
        return realm.objects(ProductModel.self)
    }
    
    static func saveObject(_ product: ProductModel) {
        try! realm.write {
            realm.add(product)
        }
    }
    
    static func deleteObject(_ product: ProductModel) {
        try! realm.write {
            realm.delete(product)
        }
    }
}


