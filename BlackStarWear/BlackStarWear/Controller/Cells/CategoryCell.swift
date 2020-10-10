//
//  CategoryCell.swift
//  BlackStarWear
//
//  Created by Дарья on 27.09.2020.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(model: CategoriesData){
        categoryLabel.text = model.name
        
        DispatchQueue.main.async {
            NetworkManager.downloadImage(urlString: model.imageURL) { (image) in
                self.categoryImageView.image = image
            }
        }
 
        
//        DispatchQueue.global().async {
//            guard let imageURL = URL(string: model.imageURL) else {return}
//            guard let imageData = try? Data(contentsOf: imageURL) else {return}
//
//            DispatchQueue.main.async {
//                self.categoryImageView.image = UIImage(data: imageData) ?? #imageLiteral(resourceName: "Str")
//            }
//        }
        
    }
    
    func configureSubCell(model: Subcategories){
        categoryLabel.text = model.name
        DispatchQueue.main.async {
            NetworkManager.downloadImage(urlString: model.iconImage ?? "https://i.pinimg.com/736x/64/60/06/64600608ad20b2a248c0b75f0ece6d52.jpg") { (image) in
                self.categoryImageView.image = image
            }
        }
    }
    

}
