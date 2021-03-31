//
//  MealBasicInfoCell.swift
//  Gofoodsie
//
//  Created by Mahmoud Shurrab on 31/03/2021.
//

import UIKit

class MealBasicInfoCell: UITableViewCell {
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealDeliveryLabel: UILabel!
    @IBOutlet weak var mealRatingLabel: UILabel!
    @IBOutlet weak var mealTimeLabel: UILabel!
    @IBOutlet weak var mealDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func displayData(_ mealData: Meal){
        mealNameLabel.text = mealData.name
        mealDeliveryLabel.text = mealData.has_delivery ?? false ? "متوفر توصيل" : "لا يتوفر توصيل"
        mealRatingLabel.text = "\(mealData.rating ?? 0) (\(mealData.rating_count ?? 0) تقييم)"
        mealTimeLabel.text = "\(mealData.must_order_before ?? 0) \(mealData.must_order_before_unit ?? "")"
        mealDescriptionLabel.text = mealData.description
    }
}
