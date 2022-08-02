//
//  FavouriteViewModel.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import Foundation

final class FavouriteViewModel: BaseViewModel {
        
    private let router = FavouriteRouter()
    var movies = [MoviesModel]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getAllMovies().forEach { savedMovie in
            movies.append(.init(movie: Movie(backdropPath: savedMovie.backdropPath ?? "",
                                             id: Int(savedMovie.id),
                                             overview: savedMovie.overview ?? "",
                                             popularity: savedMovie.popularity,
                                             posterPath: savedMovie.posterPath ?? "",
                                             releaseDate: savedMovie.releaseDate ?? "Movie.ReleaseDate.Unknown".localized(),
                                             title: savedMovie.title ?? "Movie.ReleaseDate.Unknown".localized(),
                                             voteAverage: savedMovie.voteAverage,
                                             voteCount: Int(savedMovie.voteCount)),
                                id: Int(savedMovie.id),
                                isFavourite: true))
        }
        
    }
    
    func getAllMovies() -> [SelectedMovieData] {
        CoreDataManager.shared.getAllSavedMovies()
    }
    
    func openSelectedMovie(with movie: MoviesModel) {
        router.openSelectedMovie(with: movie)
    }
    
    override func tappedOnFavourite(movie: MoviesModel) {
        CoreDataManager.shared.delete(with: Int16(movie.id))
        CoreDataManager.shared.save()
    }
    
}
