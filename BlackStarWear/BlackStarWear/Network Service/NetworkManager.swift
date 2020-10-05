//
//  NetworkManager.swift
//  BlackStarWear
//
//  Created by Дарья on 04.10.2020.
//

import Foundation

struct NetworkManager {
    
    static func fetchCategory(completion: @escaping ([CategoriesData]) -> ()){
        
        let urlString = "http://blackstarshop.ru/index.php?route=api/v1/categories"
        guard let url = URL(string: urlString) else {return}
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {return}
            do{
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let jsonDict = json as? NSDictionary{
                    
                    DispatchQueue.main.async {
                        var categories: [CategoriesData] = []
                        
                        for (_, data) in jsonDict where data is NSDictionary{
                            if let category = CategoriesData(data: data as! NSDictionary){
                                categories.append(category)
                            }
                        }
                        completion(categories)
                    }
                }
            } catch let error as NSError{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
   
}
