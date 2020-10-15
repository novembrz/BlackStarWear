//
//  ShopingCell.swift
//  BlackStarWear
//
//  Created by Дарья on 29.09.2020.
//

import UIKit

class ShopingCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(model: ProductModel){
        nameLabel.text = model.name
        sizeLabel.text = model.size
        priceLabel.text = "\(model.price) руб."
        colorLabel.text = model.color
        
        DispatchQueue.main.async {
            guard let stringURL = URL(string: model.image) else {return}
            guard let imageData = try? Data(contentsOf: stringURL) else {return}
            self.productImageView.image = UIImage(data: imageData)
        }
    }
    
}
