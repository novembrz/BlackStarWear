//
//  ProductCell.swift
//  BlackStarWear
//
//  Created by Дарья on 28.09.2020.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    static var reuseId: String = "ProductCell"
    
    let productImageView = UIImageView()
    
    let productName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Helvetica Neue", size: 15)
        return label
    }()
    
    let productPrice: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Helvetica Neue", size: 11)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .productCartColor()
        setupConstraints()
        
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        
    }
    
    
    func configureCell(model: ProductData){
        
        productName.text = model.name
        productPrice.text = "\(model.price) руб."
        
        DispatchQueue.global().async {
            guard let imageURL = URL(string: "http://blackstarshop.ru/\(model.mainImage)") else {return}
            guard let imageData = try? Data(contentsOf: imageURL) else {return}

            DispatchQueue.main.async {
                self.productImageView.image = UIImage(data: imageData)
            }
        }
    }
    
    
    private func setupConstraints(){
        
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productName.translatesAutoresizingMaskIntoConstraints = false
        productPrice.translatesAutoresizingMaskIntoConstraints = false
        
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        
        let stackView = UIStackView(arrangedSubviews: [productName, productPrice])
        stackView.axis = .vertical
        stackView.spacing = 5
        
        addSubview(productImageView)
        addSubview(productName)
        addSubview(productPrice)
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: self.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productImageView.heightAnchor.constraint(equalTo: widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            productName.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 10),
            productName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            productName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8)
        ])

        NSLayoutConstraint.activate([
            productPrice.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 5),
            productPrice.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            productPrice.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8)
        ])
    }
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


