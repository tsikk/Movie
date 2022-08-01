//
//  FavouriteContentView.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import SwiftUI
import Kingfisher

struct FavouriteContentView: View {
    
    @ObservedObject var viewModel: FavouriteViewModel
    let firstPath = "https://image.tmdb.org/t/p/w400"
    @State var isFavourite = false

    var body: some View {
        List(viewModel.getAllMovies(), id: \.self) { movie in
            ZStack(alignment: .bottom) {
                KFImage(URL(string:firstPath + (movie.posterPath ?? "nil")))
                    .placeholder {
                        ProgressView()
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxHeight: 400)
                HStack {
                    Text(movie.title ?? "unknown")
                        .bold()
                    Spacer()
                    
                    Button {
                        viewModel.tappedOnFavourite(movie: movie)
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
                viewModel.openSelectedMovie(with: MoviesModel(movie: Movie(backdropPath: movie.backdropPath ?? "",
                                                                           id: Int(movie.id),
                                                                           overview: movie.overview ?? "",
                                                                           popularity: movie.popularity,
                                                                           posterPath: movie.posterPath ?? "",
                                                                           releaseDate: movie.releaseDate ?? "",
                                                                           title: movie.title ?? "",
                                                                           voteAverage: movie.voteAverage,
                                                                           voteCount: Int(movie.voteCount)),
                                                              id: Int(movie.id)))
            }
        }
        .listStyle(.plain)
        
    }
}

struct FavouriteContentView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteContentView(viewModel: FavouriteViewModel())
    }
}
