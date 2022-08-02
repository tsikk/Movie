//
//  MovieColors.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 02.08.22.
//

import Foundation

protocol MovieColors {

    associatedtype ColorType

    static func color(named: String) -> ColorType?
}

extension MovieColors {

    static var titleColor: ColorType {
        color(named: "title_color")!
    }
    
    static var tabBarColor: ColorType {
        color(named: "tab_bar_color")!
    }
}
