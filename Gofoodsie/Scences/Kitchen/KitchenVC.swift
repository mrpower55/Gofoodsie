//
//  KitchenVC.swift
//  Gofoodsie
//
//  Created by Mahmoud Shurrab on 30/03/2021.
//

import UIKit

class KitchenVC: UIViewController {
    @IBOutlet weak var notificationBtn: UIButton!
    @IBOutlet weak var kitchenInfoView: UIView!
    @IBOutlet weak var kitchenImageView: UIImageView!
    @IBOutlet weak var kitchenNameLabel: UILabel!
    @IBOutlet weak var kitchenDescriptionLabel: UILabel!
    @IBOutlet weak var kitchenRatingLabel: UILabel!
    @IBOutlet weak var kitchenAvaliabilityLabel: UILabel!
    @IBOutlet weak var kitchenDeliveryLabel: UILabel!
    @IBOutlet weak var menusCollection: UICollectionView!
    @IBOutlet weak var mealsTable: UITableView!
    
    var kitchenData: Kitchen?
    var menusList: [Menu] = []
    var mealsList: [Meal] = []
    
    var selectedMenu = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kitchenInfoView.layer.shadowColor = UIColor.black.cgColor
        kitchenInfoView.layer.shadowOpacity = 0.3
        kitchenInfoView.layer.shadowOffset = CGSize.zero
        kitchenInfoView.layer.shadowRadius = 2
        kitchenInfoView.layer.cornerRadius = 20
        
        mealsTable.tableFooterView = UIView()
        
        kitchenInfoView.isHidden = true
        menusCollection.isHidden = true
        mealsTable.isHidden = true
        
        API.shared.getKitchenRequest(kitchenData?.id ?? 0){ response in
            debugPrint("getKitchenRequest: ",response)
            
            if response.data?.kitchen_media?.count ?? 0 > 0 {
                let imageURL = response.data?.kitchen_media?[0].urls?.href_small ?? ""
                self.kitchenImageView.displayImage(imageURL)
            } else {
                self.kitchenImageView.displayPlaceholder()
            }
            
            self.kitchenNameLabel.text = response.data?.name
            self.kitchenDescriptionLabel.text = response.data?.description
            
            self.kitchenRatingLabel.text = "\(response.data?.rating ?? 0) (\(response.data?.rating_count ?? 0) تقييم)"
            
            self.kitchenAvaliabilityLabel.text = response.data?.is_available ?? false ? "متوفر الأن" : "غير متوفر"
            
            self.kitchenDeliveryLabel.text = response.data?.has_delivery ?? false ? "متوفر توصيل" : "لا يتوفر توصيل"
            
            
            self.menusList = response.data?.menus ?? []
            self.selectedMenu = 0
            self.menusCollection.reloadData()
            
            self.mealsList = self.menusList[self.selectedMenu].meals ?? []
            self.mealsTable.reloadData()
            
            self.kitchenInfoView.isHidden = false
            self.menusCollection.isHidden = false
            self.mealsTable.isHidden = false
        }
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func notification(_ sender: Any) {
    }
}
