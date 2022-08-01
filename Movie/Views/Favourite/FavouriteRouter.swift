//
//  FavouriteRouter.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 01.08.22.
//

import Foundation

class FavouriteRouter: BaseRouting {
    
    func openSelectedMovie(with movie: MoviesModel) {
        let module = SelectedMovieAssembly.build(with: movie)
        topNavigationController?.show(module, sender: self)
    }
    
}
