//
//  ProductCartController.swift
//  BlackStarWear
//
//  Created by Дарья on 27.09.2020.
//

import UIKit

class ProductCartController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addProductButton: UIButton!
    @IBOutlet weak var infoView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blackBGColor()

        addProductButton.layer.borderWidth = 1.2
        addProductButton.layer.borderColor = UIColor.white.cgColor
        
        infoView.backgroundColor = .blackBGColor()
        infoView.layer.cornerRadius = 30
    }
    
    @IBAction func addProductTapped(_ sender: UIButton) {
    }
    
    

}
