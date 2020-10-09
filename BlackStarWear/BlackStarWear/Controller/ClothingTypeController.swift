//
//  ClothingTypeController.swift
//  BlackStarWear
//
//  Created by Дарья on 27.09.2020.
//

import UIKit

class ClothingTypeController: UIViewController {

    @IBOutlet weak var titleTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var subcategories: [Subcategories] = []
    var selectedCategory: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        titleTypeLabel.text = selectedCategory
        
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        
    }
    
}

extension ClothingTypeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subcategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClothingTypeCell") as! ClothingTypeCell
        
        let sub = subcategories[indexPath.row]
        cell.clothingLabel.text = sub.name
        
        return cell
    }
    
    
}
