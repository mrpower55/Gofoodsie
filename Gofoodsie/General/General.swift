//
//  General.swift
//  Gofoodsie
//
//  Created by Mahmoud Shurrab on 30/03/2021.
//

import UIKit

class General {
    static let shared = General()
    
    private init() {}
    
    public func showAlertDialog(_ title: String, _ message: String) {
        let alert = UIAlertController(style: .alert, title: title, message: message)
        alert.setTitle(font: .boldSystemFont(ofSize: 18), color: .black)
        alert.addAction(image: nil, title: "حسنا", color: .black, style: .default, isEnabled: true) { (UIAlertAction) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.show(animated: true, vibrate: true)
    }
}

let general = General.shared

class L102Language {
    
    /// get current Apple language
    
    class func currentAppleLanguage() -> String {
        
        let userdef = UserDefaults.standard
        
        let langArray = userdef.object(forKey: "AppleLanguages") as? NSArray ?? []
        
        let current = langArray.firstObject as? String ?? ""
        
        return current
        
    }
    
    /// set @lang to be the first in Applelanguages list
    
    class func setAppleLAnguageTo(lang: String) {
        
        let userdef = UserDefaults.standard
        
        userdef.set([lang, currentAppleLanguage()], forKey: "AppleLanguages")
        
        userdef.synchronize()
        
    }
}

