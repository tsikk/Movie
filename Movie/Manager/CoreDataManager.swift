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
    
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "MovieData")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error: \(error)")
            }
        }
    }

    func getAllSavedMovies() -> [SelectedMovieData] {
        let request: NSFetchRequest<SelectedMovieData>  = SelectedMovieData.fetchRequest()
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            print("error ")
        }
    }
    
    func delete(with id: Int16) {
        getAllSavedMovies().forEach { savedMovie in
            if savedMovie.id == id {
                viewContext.delete(savedMovie)
            }
        }
    }
}
