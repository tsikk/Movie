//
//  MovieContentView.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import SwiftUI

struct MovieContentView: View {
    @ObservedObject var viewModel: MovieViewModel

    var body: some View {
            listOfMovies
    }
    
    private var listOfMovies: some View {
        List(viewModel.movies, id: \.self) { movie in
            Text("\(movie.title)")
        }.task {
            await viewModel.loadList()
        }
    }
}

struct MovieContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieContentView(viewModel: MovieViewModel(service: MoviesService()))
    }
}
