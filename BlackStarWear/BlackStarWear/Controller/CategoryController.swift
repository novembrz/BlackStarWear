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
    @IBOutlet weak var backButton: UIButton!
    
    private var categories: [CategoriesData] = []
    private var subcategories: [Subcategories] = []
    
    private var name: String = "BLACK STAR WEAR"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = name
        
        tableView.delegate = self
        tableView.dataSource = self
        
        backButton.isHidden = true
        backButton.isEnabled = false
        
        NetworkManager.fetchCategory { (categories) in
            self.categories = categories
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "ListSegue" else { return }
        
        let indexPath = tableView.indexPathForSelectedRow!
        let navigaionVC = segue.destination as! UINavigationController
        let productVC = navigaionVC.topViewController as! ListViewController
        
        let sub = subcategories[indexPath.row]
        productVC.id = sub.id
        productVC.title = sub.name
    }
    
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        
    }
    
    
    @IBAction func backTapped(_ sender: UIButton) {
        if !subcategories.isEmpty{
            DispatchQueue.main.async {
                self.backButton.isHidden = true
                self.backButton.isEnabled = false
                self.titleLabel.text = self.name
                self.subcategories.removeAll()
                self.tableView.reloadData()
            }
        }
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
        
        if subcategories.isEmpty {
            DispatchQueue.main.async {
                
                self.backButton.isHidden = false
                self.backButton.isEnabled = true
                self.titleLabel.text = category.name
                
                if !category.subcategories.isEmpty{
                    self.subcategories.append(contentsOf: category.subcategories)
                } else {
                    self.performSegue(withIdentifier: "ListSegue", sender: self)
                }
                
                self.tableView.reloadData()
            }
        } else{
            performSegue(withIdentifier: "ListSegue", sender: self)
        }
        
    }
    
    
}


