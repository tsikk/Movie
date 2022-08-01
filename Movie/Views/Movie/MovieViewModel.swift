//`
//  MovieViewModel.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import Foundation

class MovieViewModel: BaseViewModel {
    
    @Published var movies: [MoviesModel] = []
    private let service: MoviesServiceable
    private let router = MovieRouter()
    @Published var isFavourite = false
    
    init(service: MoviesServiceable) {
        self.service = service
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Task {
            await loadList()
        }
    }
    
    // MARK: Methods
    func openSelectedMovie(with movie: MoviesModel) {
        router.openSelectedMovie(with: movie)
    }
    
    @MainActor
    func loadList() async {
         
        let fetchedData = await fetchData()
        
        switch fetchedData {
        case .success(let response):
            DispatchQueue.main.async {
                self.movies = response.results.enumerated().map { MoviesModel(movie: $0.element, id: $0.offset) }
                
                for index in 0..<self.movies.count {
                    CoreDataManager.shared.getAllSavedMovies().forEach { movie in
                        if self.movies[index].id == movie.id {
                            self.movies[index].isFavourite = true
                        }
                    }
                }
            }
        case .failure(_):
            //break
            break
        }
    }
    
    func tappedOnFavourite(movie: MoviesModel) {
        movies[movie.id].isFavourite.toggle()
        
        if !movies[movie.id].isFavourite {
            CoreDataManager.shared.delete(with: Int16(movie.id))
        } else {
            let savedMovie = SelectedMovieData(context: CoreDataManager.shared.viewContext)
            savedMovie.id = Int16(movie.id)
            savedMovie.overview = movie.overview
            savedMovie.releaseDate = movie.releaseDate
            savedMovie.voteAverage = Double(movie.voteCount)
            savedMovie.backdropPath = movie.posterURL
            savedMovie.posterPath = movie.bannerURL
            savedMovie.title = movie.title
            savedMovie.popularity = movie.popularity
            savedMovie.voteCount = Int16(movie.voteCount)
        }
        CoreDataManager.shared.save()
    }
    
    private func fetchData() async -> Result<TopRated, RequestError>{
            await service.getTopRated()
    }
    
    private func showDetail(_ movie: Movie) {
        
        Task(priority: .background) {
            
            let result = await service.getMovieDetail(id: movie.id)
            switch result {
            case .success( _): break
                // must be configured
            case .failure( _): break
                // must be configured
            }
        }
    }
}
