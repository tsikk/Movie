//
//  MovieContentView.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import SwiftUI
import Kingfisher

struct MovieContentView: View {
    @ObservedObject var viewModel: MovieViewModel
    let firstPath = "https://image.tmdb.org/t/p/w400"
    @State var isFavourite = false

    var body: some View {
            listOfMovies
    }
    
    private var listOfMovies: some View {
        List(viewModel.movies, id: \.self) { movie in
            ZStack(alignment: .bottom) {
                KFImage(URL(string:firstPath + movie.posterPath))
                    .placeholder {
                        ProgressView()
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxHeight: 400)
                HStack {
                    Text(movie.title)
                        .bold()
                    Spacer()
                    
                    Button {
                        viewModel.save(movie: movie)
                    } label: {
                        Image(systemName: isFavourite ? "star.fill" : "star")
                            .foregroundColor(.red)
                    }.buttonStyle(.bordered)
                    
                }
                .padding()
                .background(.thinMaterial)
            }
            .background(.thickMaterial)
            .mask(RoundedRectangle(cornerRadius: 16))
            .padding(8)
            
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .onTapGesture {
                    viewModel.openSelectedMovie(with: movie)
                }
        }
        .listStyle(.plain)
    }
}

struct MovieContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieContentView(viewModel: MovieViewModel(service: MoviesService()))
    }
}
