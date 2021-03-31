//
//  MealVC+Table.swift
//  Gofoodsie
//
//  Created by Mahmoud Shurrab on 30/03/2021.
//

import UIKit

extension MealVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MealImageCell.self), for: indexPath as IndexPath) as! MealImageCell
            cell.displayData(mealData!)
            
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MealBasicInfoCell.self), for: indexPath as IndexPath) as! MealBasicInfoCell
            cell.displayData(mealData!)
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MealExtraInfoCell.self), for: indexPath as IndexPath) as! MealExtraInfoCell
        cell.displayData(mealData!, quantity)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
