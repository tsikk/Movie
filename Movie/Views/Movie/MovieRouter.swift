//
//  MovieRouter.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 31.07.22.
//

import Foundation

class MovieRouter: BaseRouting {
    
    func openSelectedMovie(with movie: Movie) {
        let module = SelectedMovieAssembly.build(with: movie)
        topNavigationController?.show(module, sender: self)
    }
    
}
