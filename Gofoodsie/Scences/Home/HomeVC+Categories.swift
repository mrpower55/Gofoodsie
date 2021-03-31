//
//  HomeVC+Categories.swift
//  Gofoodsie
//
//  Created by Mahmoud Shurrab on 30/03/2021.
//

import UIKit

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : ItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ItemCell.self), for: indexPath) as! ItemCell
        
        cell.displayData(categoriesList[indexPath.row].name ?? "")
        cell.titleLabel.textColor = selectedCategory == indexPath.row ? orangeColor : grayColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCategory = indexPath.row
        kitchensList = categoriesList[selectedCategory].kitchens ?? []
        
        self.categoriesCollectionView.reloadData()
        self.kitchensTableView.reloadData()
    }
}
