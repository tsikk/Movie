//
//  FavouriteAssembly.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import UIKit

struct FavouriteAssembly {
    
    static func build() -> UIViewController {
        
        let viewModel = FavouriteViewModel()
        let view = FavouriteContentView(viewModel: viewModel)
        let controller = BaseTabRootViewController<FavouriteViewModel, FavouriteContentView>(rootView: view)
        controller.viewModel = viewModel
        controller.title = "Favourite"
        controller.tabBarItem = TabFactory.barItem(for: .favourite)
        return controller
    }
    
}
