//
//  MealCell.swift
//  Gofoodsie
//
//  Created by Mahmoud Shurrab on 30/03/2021.
//

import UIKit

class MealCell: UITableViewCell {
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealDescriptionLabel: UILabel!
    @IBOutlet weak var mealPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func displayData(_ mealData: Meal){
        if mealData.meal_media?.count ?? 0 > 0 {
            let imageURL = mealData.meal_media?[0].urls?.href_small ?? ""
            mealImageView.displayImage(imageURL)
        } else {
            mealImageView.displayPlaceholder()
        }
        
        mealNameLabel.text = mealData.name
        mealDescriptionLabel.text = mealData.description
        mealPriceLabel.text = "\(mealData.price ?? 0) \(mealData.meal_currency ?? "")"
    }
}
