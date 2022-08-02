//
//  CoreDataManager.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 01.08.22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()

    let container: NSPersistentContainer
    @Published var savedEntities: [SelectedMovieData] = []
    
    init() {
        container = NSPersistentContainer(name: "MovieData")
        container.loadPersistentStores { description, error  in
            if let error = error {
                fatalError("unable to confiure core data \(error )")
            }
        }
        
        fetchMovie()
    }
    
    func fetchMovie() {
        let request = NSFetchRequest<SelectedMovieData>(entityName: "SelectedMovieData")
        do {
           savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("\(error)")
        }
    }
    
    func addMovie(with movie: MoviesModel) {
        let newMovie = SelectedMovieData(context: container.viewContext)
        
        newMovie.id = Int16(movie.id)
        newMovie.overview = movie.overview
        newMovie.releaseDate = movie.releaseDate
        newMovie.voteAverage = Double(movie.voteCount)
        newMovie.backdropPath = movie.posterURL
        newMovie.posterPath = movie.bannerURL
        newMovie.title = movie.title
        newMovie.popularity = movie.popularity
        newMovie .voteCount = Int16(movie.voteCount)
        
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchMovie()
        } catch let error {
            fatalError("Error Saving. \(error)")
        }
    }
    
    func delete(with id: Int16) {
        savedEntities.forEach { savedMovie in
            if savedMovie.id == id {
                container.viewContext.delete(savedMovie)
            }
        }
        saveData()
    }
}
