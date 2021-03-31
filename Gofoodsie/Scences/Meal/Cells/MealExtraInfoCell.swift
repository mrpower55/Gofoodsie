//
//  MealExtraInfoCell.swift
//  Gofoodsie
//
//  Created by Mahmoud Shurrab on 31/03/2021.
//

import UIKit

class MealExtraInfoCell: UITableViewCell {
    @IBOutlet weak var mealUnitLabel: UILabel!
    @IBOutlet weak var mealQuantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func displayData(_ mealData: Meal, _ quantity: Int){
        mealUnitLabel.text = mealData.meal_unit
        mealQuantityLabel.text = "\(quantity)"
    }
}
