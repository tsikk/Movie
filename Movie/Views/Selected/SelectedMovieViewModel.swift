//
//  SelectedMovieViewModel.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 31.07.22.
//

import Foundation

class SelectedMovieViewModel: BaseViewModel {
    var movie: MoviesModel

    init(with movie: MoviesModel) {
        self.movie = movie
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
}
