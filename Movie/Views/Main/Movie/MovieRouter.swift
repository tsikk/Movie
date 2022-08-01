//
//  MovieRouter.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 31.07.22.
//

import UIKit

class MovieRouter: BaseRouting {
    
    func openSelectedMovie(with movie: MoviesModel) {
        let module = SelectedMovieAssembly.build(with: movie)
        topNavigationController?.show(module, sender: self)
    }
    
    func createAlertForFetching(title: String) {
        let alert = UIAlertController(title: title,
                                      message: nil,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok",
                                     style: .default)
        
        alert.addAction(okAction)
        
        anyTopController?.present(alert, animated: true)

    }
    
    func closeModule() {
        topNavigationController?.dismiss(animated: true)
    }
}
