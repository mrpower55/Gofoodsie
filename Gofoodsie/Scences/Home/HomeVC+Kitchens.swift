//
//  HomeVC+Kitchens.swift
//  Gofoodsie
//
//  Created by Mahmoud Shurrab on 30/03/2021.
//

import UIKit

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kitchensList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: KitchenCell.self), for: indexPath as IndexPath) as! KitchenCell
        cell.displayData(kitchensList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("kitchen: ",kitchensList[indexPath.row])
        let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: KitchenVC.self)) as? KitchenVC
        vc?.kitchenData = kitchensList[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
