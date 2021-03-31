//
//  KitchenCell.swift
//  Gofoodsie
//
//  Created by Mahmoud Shurrab on 30/03/2021.
//

import UIKit

class KitchenCell: UITableViewCell {
    @IBOutlet weak var kitchenImageView: UIImageView!
    @IBOutlet weak var kitchenNameLabel: UILabel!
    @IBOutlet weak var kitchenDescriptionLabel: UILabel!
    @IBOutlet weak var kitchenRatingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func displayData(_ kitchenData: Kitchen){
        if kitchenData.kitchen_media?.count ?? 0 > 0 {
            let imageURL = kitchenData.kitchen_media?[0].urls?.href_small ?? ""
            kitchenImageView.displayImage(imageURL)
        } else {
            kitchenImageView.displayPlaceholder()
        }
        
        kitchenNameLabel.text = kitchenData.name
        kitchenDescriptionLabel.text = kitchenData.description
        kitchenRatingLabel.text = "\(kitchenData.rating ?? 0) (\(kitchenData.rating_count ?? 0) تقييم)"
    }
}
