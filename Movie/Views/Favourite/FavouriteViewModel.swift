//
//  FavouriteViewModel.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import Foundation

final class FavouriteViewModel: BaseViewModel {
        
    private let router = FavouriteRouter()
    
    func getAllMovies() -> [SelectedMovieData] {
        CoreDataManager.shared.getAllSavedMovies()
    }
    
    func openSelectedMovie(with movie: MoviesModel) {
        router.openSelectedMovie(with: movie)
    }
    
    func tappedOnFavourite(movie: SelectedMovieData) {
        CoreDataManager.shared.delete(with: Int16(movie.id))
        CoreDataManager.shared.save()
    }
    
}
