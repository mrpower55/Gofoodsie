//
//  UIViewController+Extenstion.swift
//  Gofoodsie
//
//  Created by Mahmoud Shurrab on 30/03/2021.
//

import UIKit

extension UIViewController {
    func switchRootViewController(_ rootViewController: UIViewController, _ animationOption: UIView.AnimationOptions) {
        guard let window = UIApplication.shared.keyWindow else { return }
        UIView.transition(with: window, duration: 0.5, options: animationOption, animations: {
            let oldState: Bool = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            window.rootViewController = rootViewController
            UIView.setAnimationsEnabled(oldState)
        }, completion: nil)
    }
}
