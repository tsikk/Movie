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

    var body: some View {
        List(viewModel.movies, id: \.self) { movie in
          MovieCardView(movie: movie, viewModel: viewModel)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .onTapGesture {
                    viewModel.openSelectedMovie(with: movie)
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
