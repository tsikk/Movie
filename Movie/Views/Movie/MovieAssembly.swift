//
//  MovieAssembly.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import UIKit

struct MovieAssembly {
    
    static func build() -> UIViewController {
        
        let viewModel = MovieViewModel()
        let view = MovieContentView(viewModel: viewModel)
        let controller = MovieViewController(rootView: view)
        controller.viewModel = viewModel
        controller.title = "Movie"
        controller.tabBarItem = TabFactory.barItem(for: .movie)
        return controller
    }
    
}
