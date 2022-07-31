//
//  UIViewController+Helper.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import UIKit

extension UIViewController {

    static var keyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first
    }
}
