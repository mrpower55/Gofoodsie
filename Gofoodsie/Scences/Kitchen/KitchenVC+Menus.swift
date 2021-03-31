//
//  KitchenVC+Menus.swift
//  Gofoodsie
//
//  Created by Mahmoud Shurrab on 30/03/2021.
//

import UIKit

extension KitchenVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : ItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ItemCell.self), for: indexPath) as! ItemCell
        
        cell.displayData(menusList[indexPath.row].name ?? "")
        cell.titleLabel.textColor = selectedMenu == indexPath.row ? orangeColor : grayColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menusList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedMenu = indexPath.row
        mealsList = menusList[selectedMenu].meals ?? []
        
        self.menusCollection.reloadData()
        self.mealsTable.reloadData()
    }
}
