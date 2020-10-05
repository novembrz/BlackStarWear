//
//  CategoryController.swift
//  BlackStarWear
//
//  Created by Дарья on 27.09.2020.
//

import UIKit

class CategoryController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categories: [CategoriesData] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NetworkManager.fetchCategory { (categories) in
            self.categories = categories
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        
    }

}


//MARK: UITableViewDataSource UITableViewDelegate

extension CategoryController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! CategoryCell
        
        let cetegory = categories[indexPath.row]
        cell.configureCell(model: cetegory)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let category = categories[indexPath.row]
        
//        courseURL = course.link
//        courseName = course.name
        
        performSegue(withIdentifier: "SubcategorySegue", sender: self)
    }
    
    
}
