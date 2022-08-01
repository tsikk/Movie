//
//  MovieAssembly.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import UIKit

struct MovieAssembly {
    
    static func build() -> UIViewController {
        
        let viewModel = MovieViewModel(service: MoviesService())
        let view = MovieContentView(viewModel: viewModel)
        let controller = MovieViewController(rootView: view)
        controller.navigationController?.navigationBar.prefersLargeTitles = true
        controller.viewModel = viewModel
        controller.title = "Movies"
        controller.tabBarItem = TabFactory.barItem(for: .movie)
        return controller
    }
    
}
