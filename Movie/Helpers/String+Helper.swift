//
//  String+Helper.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 02.08.22.
//

import Foundation

extension String {
    func localized() -> String {
            return NSLocalizedString(self,
                                     tableName: "Localizable",
                                     bundle: .main,
                                     value: self,
                                     comment: self)
    }
}
