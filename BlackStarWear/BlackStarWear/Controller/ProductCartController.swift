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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var productArray = ["Hands", "Love", "Str"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blackBGColor()

        addProductButton.layer.borderWidth = 1.2
        addProductButton.layer.borderColor = UIColor.white.cgColor
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    @IBAction func addProductTapped(_ sender: UIButton) {
        
    }
    

}

extension ProductCartController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ProductImageCell
        
        let product = productArray[indexPath.item]
        cell.imageView.image = UIImage(imageLiteralResourceName: product)
        
        return cell
    }
    
    
}
