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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension ClothingTypeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClothingTypeCell") as! ClothingTypeCell
        
        cell.clothingLabel.text = "\(indexPath.row)"
        
        return cell
    }
    
    
}
