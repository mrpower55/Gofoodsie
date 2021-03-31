//
//  HomeVC.swift
//  Gofoodsie
//
//  Created by Mahmoud Shurrab on 30/03/2021.
//

import UIKit

class HomeVC: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var slogenLabel: UILabel!
    @IBOutlet weak var kitchensTableView: UITableView!
    
    var categoriesList: [Category] = []
    var kitchensList: [Kitchen] = []
    
    var selectedCategory = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        kitchensTableView.tableFooterView = UIView()
        
        categoriesCollectionView.isHidden = true
        slogenLabel.isHidden = true
        kitchensTableView.isHidden = true
        
        API.shared.getDashboardRequest{ response in
            self.categoriesList = response.data?.category ?? []
            self.categoriesCollectionView.reloadData()
            
            self.slogenLabel.text = response.data?.slogan ?? ""
            
            self.selectedCategory = 0
            self.kitchensList = self.categoriesList[self.selectedCategory].kitchens ?? []
            self.kitchensTableView.reloadData()
            
            self.categoriesCollectionView.isHidden = false
            self.slogenLabel.isHidden = false
            self.kitchensTableView.isHidden = false
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return (otherGestureRecognizer is UIScreenEdgePanGestureRecognizer)
    }
}
