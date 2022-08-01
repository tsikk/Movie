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
                        viewModel.delete(with: movie.id)
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
//                $viewModel.openSelectedMovie(with: movie)
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
