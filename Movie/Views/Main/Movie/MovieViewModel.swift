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
                    CoreDataManager.shared.savedEntities.forEach { movie in
                        if self.movies[index].id == movie.id {
                            self.movies[index].isFavourite = true
                        }
                    }
                }
            }
        case .failure(let error):
            switch error {
            case .unauthorized:
                router.createAlertForFetching(title: "Movie.Alert.Unauthorized".localized())
            case .invalidURL:
                router.createAlertForFetching(title: "Movie.Alert.InvalidURL".localized())
            case .decode, .noResponse,.unexpectedStatusCode, .unknown:
                router.createAlertForFetching(title: "Movie.Alert.Default".localized())
            }
        }
    }
    
    override func tappedOnFavourite(movie: MoviesModel) {
        if !movies[movie.id].isFavourite {
            CoreDataManager.shared.delete(with: Int16(movie.id))
        } else {
            CoreDataManager.shared.addMovie(with: movie)
        }
        movies[movie.id].isFavourite.toggle()

    }
    
    private func fetchData() async -> Result<TopRated, RequestError>{
            await service.getTopRated()
    }
    
}
