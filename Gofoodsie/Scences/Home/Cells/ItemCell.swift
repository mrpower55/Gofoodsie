//
//  ItemCell.swift
//  Gofoodsie
//
//  Created by Mahmoud Shurrab on 30/03/2021.
//

import UIKit

class ItemCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func displayData(_ title: String) {
        titleLabel.text = title
    }
}
