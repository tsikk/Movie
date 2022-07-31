//
//  RootAssembly.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import UIKit

struct RootAssembly {

    static func build(with modules: [UIViewController]) -> UIViewController {
        let viewModel = RootViewModel()
        let controller = RootViewController(viewModel: viewModel, modules: modules)

        return controller
    }
}
