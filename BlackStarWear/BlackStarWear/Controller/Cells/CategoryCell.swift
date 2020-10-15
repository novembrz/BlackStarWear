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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var labelTrConstraints: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(model: CategoriesData){
        
        categoryLabel.text = model.name
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        DispatchQueue.global().async {
            guard let imageURL = URL(string: "http://blackstarshop.ru/\(model.imageURL)") else {return}
            guard let imageData = try? Data(contentsOf: imageURL) else {return}

            DispatchQueue.main.async {
                self.categoryImageView.image = UIImage(data: imageData) ?? #imageLiteral(resourceName: "9t0a8451-450x600-k90")
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            }
        }
        
    }
    
    func configureSubCell(model: Subcategories){
        
        categoryLabel.text = model.name
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        DispatchQueue.main.async {
            guard let imageURL = URL(string: "http://blackstarshop.ru/\(model.iconImage ?? "")") else {return}
            guard let imageData = try? Data(contentsOf: imageURL) else {return}
            self.categoryImageView.image = UIImage(data: imageData) ?? #imageLiteral(resourceName: "9t0a8451-450x600-k90")
            
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
        
    }
    

}
