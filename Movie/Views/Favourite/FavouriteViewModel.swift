//
//  FavouriteViewModel.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import Foundation

final class FavouriteViewModel: BaseViewModel {
        
    func getAllMovies() -> [SelectedMovieData] {
        CoreDataManager.shared.getAllSavedMovies()
    }
    
    func delete(with id: Int16) {
        CoreDataManager.shared.delete(with: id)
    }
}
