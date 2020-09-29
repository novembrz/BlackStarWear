//
//  ShopingCartController.swift
//  BlackStarWear
//
//  Created by Дарья on 29.09.2020.
//

import UIKit

class ShopingCartController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var shopingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shopingButton.layer.borderWidth = 1.2
        shopingButton.layer.borderColor = UIColor.white.cgColor
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    

}

extension ShopingCartController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopingCell") as! ShopingCell
        
        
        return cell
    }
    
    
}
