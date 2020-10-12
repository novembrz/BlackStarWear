//
//  ProductCartController.swift
//  BlackStarWear
//
//  Created by Дарья on 27.09.2020.
//

import UIKit

class ProductCartController: UIViewController {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addProductButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var product: ProductData!
    var stringArray: [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blackBGColor()

        addProductButton.layer.borderWidth = 1.2
        addProductButton.layer.borderColor = UIColor.white.cgColor
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        guard let product = product else {return}
        priceLabel.text = product.price
        title = product.name
        getImageString()
        
    }
    
    private func getImageString(){
        if !product.productImages.isEmpty{
            for dict in product.productImages {
                self.stringArray.append("http://blackstarshop.ru/\(dict.imageURL)")
            }
        } else {
            self.stringArray.append("http://blackstarshop.ru/\(product.mainImage)")
        }
    }
    
    
    @IBAction func addProductTapped(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Выберите размер", message: "", preferredStyle: .actionSheet)
        
        for dict in product.offers{
            if dict.quantity != "0" {
                let addAction = UIAlertAction(title: dict.size, style: .default) { (action) in
                    
                }
                alert.addAction(addAction)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Назад", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    

}


//MARK: UICollectionView Delegate & DataSource

extension ProductCartController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stringArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ProductImageCell
        
        let stringUrl = stringArray[indexPath.item]
        cell.addImage(url: stringUrl)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 1.25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    
}
