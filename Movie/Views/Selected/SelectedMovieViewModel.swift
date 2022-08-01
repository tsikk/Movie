//
//  SelectedMovieViewModel.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 31.07.22.
//

import Foundation

class SelectedMovieViewModel: BaseViewModel {
    var movie: Movie
    let firstPath = "https://image.tmdb.org/t/p/w400"

    init(with movie: Movie) {
        self.movie = movie
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    var releaseDate: String {
        movie.convertedReleaseDate() ?? "unknown"
    }
    
    var rating: Int {
        Int(movie.voteAverage / 2)
    }
    
    var posterURL: URL? {
       URL(string: firstPath + movie.backdropPath) 
    }
    
    var overview: String {
        movie.overview
    }
}
