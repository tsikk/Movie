//
//  MoviesService.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 31.07.22.
//

import Foundation

protocol MoviesServiceable {
    func getTopRated() async -> Result<TopRated, RequestError>
    func getMovieDetail(id: Int) async -> Result<Movie, RequestError>
}

struct MoviesService: HTTPClient, MoviesServiceable {
    func getTopRated() async -> Result<TopRated, RequestError> {
        return await sendRequest(endpoint: MoviesEndpoint.topRated, responseModel: TopRated.self)
    }
    
    func getMovieDetail(id: Int) async -> Result<Movie, RequestError> {
        return await sendRequest(endpoint: MoviesEndpoint.movieDetail(id: id), responseModel: Movie.self)
    }
}
