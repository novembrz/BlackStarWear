//
//  CategoryController.swift
//  BlackStarWear
//
//  Created by Дарья on 27.09.2020.
//

import UIKit

class CategoryController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var categories: [CategoriesData] = []
    private var subcategories: [Subcategories] = []
    
    private var name: String = "BLACK STAR WEAR"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = name
        
        tableView.delegate = self
        tableView.dataSource = self 
        
        NetworkManager.fetchCategory { (category) in
            self.categories = category
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let listVC = segue.destination as? ListViewController, segue.identifier == "ListSegue" {
            
        }
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        
    }

}


//MARK: UITableViewDataSource UITableViewDelegate

extension CategoryController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !subcategories.isEmpty {
            return subcategories.count
        } else {
            return categories.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! CategoryCell
        
        if !subcategories.isEmpty {
            let sub = subcategories[indexPath.row]
            cell.configureSubCell(model: sub)
        } else {
            let category = categories[indexPath.row]
            cell.configureCell(model: category)
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let category = categories[indexPath.row]
        
        if !category.subcategories.isEmpty {
            DispatchQueue.main.async {
                self.name = category.name
                self.subcategories = category.subcategories
                self.tableView.reloadData()
            }
        } else if !subcategories.isEmpty{
            performSegue(withIdentifier: "ListSegue", sender: self)
        }
        
    }
    
    
}
