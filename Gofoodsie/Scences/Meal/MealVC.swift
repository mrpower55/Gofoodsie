//
//  MealVC.swift
//  Gofoodsie
//
//  Created by Mahmoud Shurrab on 30/03/2021.
//

import UIKit

class MealVC: UIViewController {
    @IBOutlet weak var mealTable: UITableView!
    
    var mealData: Meal?
    var quantity = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealTable.tableFooterView = UIView()

        API.shared.getMealRequest(mealData?.id ?? 0){ response in
            debugPrint("getMealsRequest: ",response)
            self.mealData = response.data
            self.mealTable.reloadData()
        }
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func favorite(_ sender: Any) {
    }
    
    @IBAction func Quantity(_ sender: UIButton) {
        if sender.tag == 0 {
            quantity = max(quantity - 1, 1)
        } else {
            quantity = quantity + 1
        }
        
        mealTable.reloadData()
    }
}
