//
//  ProductImageCell.swift
//  BlackStarWear
//
//  Created by Дарья on 06.10.2020.
//

import UIKit

class ProductImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var imageData = Data()
    
    override func prepareForReuse() { // для переиспользования ячейки, когда картинка подгружается с ервера, то она иногда не успевает поменятся в ячейке  поэтому мы обнуляем
        super.prepareForReuse()
        self.imageView.image = nil
    }
    
    func addImage(url: String){
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        DispatchQueue.global().async {
            guard let urlString = URL(string: url) else {return}
            guard let imageData = try? Data(contentsOf: urlString) else {return}
            self.imageData = imageData
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: imageData)
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            }
        }
        
    }
}
