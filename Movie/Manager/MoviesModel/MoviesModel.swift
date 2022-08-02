//
//  MoviesModel.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 01.08.22.
//

import Foundation

struct MoviesModel: Hashable {
    private let movie: Movie
    private let firstPath = "https://image.tmdb.org/t/p/w400"

    init(movie: Movie, id: Int, isFavourite: Bool = false) {
        self.movie = movie
        self.id = id
        self.isFavourite = isFavourite
    }
    
    var isFavourite: Bool
    var id: Int
    
    var releaseDate: String {
        movie.convertedReleaseDate() ?? "Movie.ReleaseDate.Unknown".localized()
    }
    
    var rating: Int {
        Int(movie.voteAverage / 2)
    }
    
    var posterURL: String {
       firstPath + movie.backdropPath
    }
    
    var overview: String {
        movie.overview
    }
    
    var title: String {
        movie.title
    }
    
    var bannerURL: String {
        firstPath + movie.posterPath
    }
    
    var voteCount: Int {
        movie.voteCount
    }
    
    var voteAverage: Int {
        Int(movie.voteAverage / 2)
    }
    
    var popularity: Double {
        movie.popularity
    }
}
