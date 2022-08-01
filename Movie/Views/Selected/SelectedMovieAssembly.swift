//
//  SelectedMovieAssembly.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 31.07.22.
//

import UIKit

struct SelectedMovieAssembly {
    
    static func build(with movie: MoviesModel) -> UIViewController {
        
        let viewModel = SelectedMovieViewModel(with: movie)
        let view = SelectedMovieContentView(viewModel: viewModel)
        let controller = BaseViewController<SelectedMovieViewModel, SelectedMovieContentView>(rootView: view)
        controller.viewModel = viewModel
        controller.title = movie.title
        return controller
    }
    
}
