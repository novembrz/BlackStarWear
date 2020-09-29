//
//  ClothingTypeCell.swift
//  BlackStarWear
//
//  Created by Дарья on 27.09.2020.
//

import UIKit

class ClothingTypeCell: UITableViewCell {

    @IBOutlet weak var clothingImageView: UIImageView!
    @IBOutlet weak var clothingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
