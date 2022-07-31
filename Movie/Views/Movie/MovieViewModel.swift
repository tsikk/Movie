//`
//  MovieViewModel.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import Foundation

class MovieViewModel: BaseViewModel {
    
    @Published var movies: [Movie] = []
    private let service: MoviesServiceable
    
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
    private func fetchData() async -> Result<TopRated, RequestError>{
            await service.getTopRated()
    }
    
    @MainActor
    func loadList() async {
         
        let fetchedData = await fetchData()
        
        switch fetchedData {
        case .success(let response):
            DispatchQueue.main.async {
                self.movies = response.results
            }
        case .failure(_):
            //break
            break
        }
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
