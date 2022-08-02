//
//  BaseViewModel.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import Foundation

class BaseViewModel: ViewModeling, ObservableObject {

    required init() {
        initialSetup()
    }

    func initialSetup() {}
    func viewWillAppear(_ animated: Bool) {}
    func viewDidAppear(_ animated: Bool) {}
    func viewWillDisappear(_ animated: Bool) {}

    
    func tappedOnFavourite(movie: MoviesModel) {
        // needs to be overriden
    }

}
