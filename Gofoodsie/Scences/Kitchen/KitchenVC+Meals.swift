//
//  KitchenVC+Meals.swift
//  Gofoodsie
//
//  Created by Mahmoud Shurrab on 30/03/2021.
//

import UIKit

extension KitchenVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MealCell.self), for: indexPath as IndexPath) as! MealCell
        cell.displayData(mealsList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: MealVC.self)) as? MealVC
        vc?.mealData = mealsList[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
