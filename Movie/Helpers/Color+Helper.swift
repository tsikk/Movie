//
//  Color+Helper.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 02.08.22.
//

import SwiftUI

extension Color: MovieColors {

    static func color(named: String) -> Color? {
        Color(named)
    }
}
