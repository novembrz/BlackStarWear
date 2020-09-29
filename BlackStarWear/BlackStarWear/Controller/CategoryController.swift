//
//  CategoryController.swift
//  BlackStarWear
//
//  Created by Дарья on 27.09.2020.
//

import UIKit

class CategoryController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        
    }
    

}

extension CategoryController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! CategoryCell
        cell.categoryLabel.text = "\(indexPath.row)"
        return cell
    }
    
    
}
