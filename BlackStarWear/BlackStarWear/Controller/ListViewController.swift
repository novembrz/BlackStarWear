//
//  ListViewController.swift
//  BlackStarWear
//
//  Created by Дарья on 29.09.2020.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var collectionView: UICollectionView!
    
    var id: String?

    var products: [ProductData] = []
    var selectedProduct: ProductData?
    
    let shopingVC = ShopingCartController()
    let productVC = ProductCartController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.hidesWhenStopped = true
        
        navigationController?.navigationBar.barTintColor = .blackBGColor()
        view.backgroundColor = .blackBGColor()
        createCollectionView()
        
        guard let id = id else {return}
        
        NetworkManager.fetchProducts(id: id) { (products) in
            self.activityIndicator.startAnimating()
            self.products = products
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            }
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ProductSegue" else { return }
        let productVC = segue.destination as! ProductCartController
        
        guard let selectedProduct = selectedProduct else {return}
        productVC.product = selectedProduct
        
    }

    
    
    private func createCollectionView(){
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .blackBGColor()
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseId)
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    

}

//MARK: Create Compositional Layout

extension ListViewController {
    
    private func createCompositionalLayout() -> UICollectionViewLayout{
        
        let layout = UICollectionViewCompositionalLayout { (senctionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .fractionalWidth(0.65))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            let spacing = CGFloat(15)
            group.interItemSpacing = .fixed(spacing)
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = spacing
            section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 15, bottom: 0, trailing: 15)
            
            return section
        }
        
        return layout
        
    }
    
}


//MARK: UICollectionViewDelegate & Source

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseId, for: indexPath) as! ProductCell
        
        let product = products[indexPath.item]
        cell.configureCell(model: product)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let product = products[indexPath.item]
        selectedProduct = product
        
        performSegue(withIdentifier: "ProductSegue", sender: self)
    }
    
    
}

