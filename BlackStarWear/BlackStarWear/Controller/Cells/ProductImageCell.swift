//
//  ProductImageCell.swift
//  BlackStarWear
//
//  Created by Дарья on 06.10.2020.
//

import UIKit

class ProductImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func prepareForReuse() { // для переиспользования ячейки, когда картинка подгружается с ервера, то она иногда не успевает поменятся в ячейке  поэтому мы обнуляем
        super.prepareForReuse()
        self.imageView.image = nil
    }
    
//    func setupCell(product: Product){
//        self.productImageView.image = product.image
//    }
}
