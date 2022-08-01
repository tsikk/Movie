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

    init(movie: Movie, id: Int) {
        self.movie = movie
        self.id = id
    }
    
    var id: Int
    var isFavourite = false

    var releaseDate: String {
        movie.convertedReleaseDate() ?? "unknown"
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
    
    var popularity: Double {
        movie.popularity
    }
}
