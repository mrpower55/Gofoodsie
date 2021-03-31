//
//  Global.swift
//  Roseyar
//
//  Created by Mahmoud Shurrab on 8/13/20.
//  Copyright © 2020 Kenan Compnay. All rights reserved.
//

import UIKit

struct Screen {
    static var width: CGFloat {
        return UIScreen.main.bounds.width
    }
    static var height: CGFloat {
        return UIScreen.main.bounds.height
    }
    static var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height
    }
}

var countriesCodesList: [CountryCode] = []

//App Colors
let orangeColor = UIColor(hexString: "#E38941")
let blackColor = UIColor(hexString: "#000000")
let grayColor = UIColor(hexString: "#aaaaaa")

