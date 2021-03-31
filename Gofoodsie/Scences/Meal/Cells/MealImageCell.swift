//
//  MealImageCell.swift
//  Gofoodsie
//
//  Created by Mahmoud Shurrab on 30/03/2021.
//

import UIKit

class MealImageCell: UITableViewCell {
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealPriceView: UIView!
    @IBOutlet weak var mealPriceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mealPriceView.roundCorners(corners: [.topRight, .bottomRight], radius: 20.0)
    }
    
    func displayData(_ mealData: Meal){
        if mealData.meal_media?.count ?? 0 > 0 {
            let imageURL = mealData.meal_media?[0].urls?.href_small ?? ""
            mealImageView.displayImage(imageURL)
        } else {
            mealImageView.displayPlaceholder()
        }
        
        mealPriceLabel.text = "\(mealData.price ?? 0) \(mealData.meal_currency ?? "")"
    }
}
