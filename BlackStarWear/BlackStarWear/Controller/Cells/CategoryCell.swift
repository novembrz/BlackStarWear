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
        
        /*
        DispatchQueue.main.async {
            NetworkManager.downloadCategoryImage(urlString: model.imageURL) { (image) in
                self.categoryImageView.image = image
            }
        }
 */
        
        /*
        
        DispatchQueue.global().async {
            guard let imageURL = URL(string: model.imageURL) else {return}
            guard let imageData = try? Data(contentsOf: imageURL) else {return}

            DispatchQueue.main.async {
                self.categoryImageView.image = UIImage(data: imageData) ?? #imageLiteral(resourceName: "4")
            }
        }
 
         */
        
        
    }
    
    func configureSubCell(model: Subcategories){
        categoryLabel.text = model.name
    }
    

}
