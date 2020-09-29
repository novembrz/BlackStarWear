//
//  ListViewController.swift
//  BlackStarWear
//
//  Created by Дарья on 29.09.2020.
//

import UIKit

class ListViewController: UIViewController {
    
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blackBGColor()
        createCollectionView()
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

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseId, for: indexPath) as! ProductCell
        
        return cell
    }
    
    
}
