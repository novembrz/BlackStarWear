//
//  ShopingCartController.swift
//  BlackStarWear
//
//  Created by Дарья on 29.09.2020.
//

import UIKit

class ShopingCartController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var allPriceLabel: UILabel!
    
    private var productsList = RealmManager.productsList
    
    var allPrice = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        mainButton.layer.borderWidth = 1.2
        mainButton.layer.borderColor = UIColor.white.cgColor
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        allPrice = 0
        for prod in productsList {
            allPrice += prod.price
        }
        allPriceLabel.text = "\(allPrice) руб."
        
        productsList = realm.objects(ProductModel.self)
        tableView.reloadData()
    }
    
    
    @IBAction func mainTapped(_ sender: UIButton) {
        
        if !productsList.isEmpty {
            
            RealmManager.deleteAll(productsList)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            allPrice = 0
            allPriceLabel.text = "\(allPrice) руб."
            
            let alert = UIAlertController(title: "Успешно!", message: "Ваш заказ принят!", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Назад", style: .cancel, handler: nil)
            
            alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil)
        } else {
            sender.shake()
        }
        
    }
    
}


// MARK: UITableViewDelegate & DataSource

extension ShopingCartController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopingCell") as! ShopingCell
        
        let product = productsList[indexPath.row]
        cell.configureCell(model: product)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let product = productsList[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, _) in
            RealmManager.deleteObject(product)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        allPrice -= product.price
        allPriceLabel.text = "\(allPrice) руб."
        
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
}
