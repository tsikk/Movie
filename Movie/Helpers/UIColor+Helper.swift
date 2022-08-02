//
//  UIColor+Helper.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 02.08.22.
//

import UIKit.UIColor

extension UIColor: MovieColors {

    static func color(named: String) -> UIColor? {
        UIColor(named: named)
    }
}
