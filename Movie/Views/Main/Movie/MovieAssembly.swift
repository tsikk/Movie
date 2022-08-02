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
        let controller = BaseTabRootViewController<MovieViewModel, MovieContentView>(rootView: view)
        controller.viewModel = viewModel
        controller.title = "Tab.Movie.Title".localized()
        controller.tabBarItem = TabFactory.barItem(for: .movie)
        return controller
    }
    
}
