//
//  SelectedMovieContentView.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 31.07.22.
//

import SwiftUI
import Kingfisher

struct SelectedMovieContentView: View {
    @ObservedObject var viewModel: SelectedMovieViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            ZStack(alignment: .bottom) {
                KFImage(URL(string: viewModel.movie.posterURL))
                    .placeholder {
                        ProgressView()
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxHeight: 200)
                
                HStack {
                    RatingView(rating: viewModel.movie.voteAverage)
                    Spacer()
                }
                .padding(8)
                .background(.thinMaterial)
            }
            .background(.thickMaterial)
            .mask(RoundedRectangle(cornerRadius: 16))
            
            VStack(alignment: .leading, spacing: 16) {
                
                Text("SelectedMovie.ReleaseDate".localized() + viewModel.movie.releaseDate)
                    .bold()
                    .font(.headline)
                    .foregroundColor(.titleColor)
                
                ScrollView {
                    Text(viewModel.movie.overview)
                        .bold()
                        .font(.title)
                        .foregroundColor(.titleColor)
                }
            }
            .padding()
            
            Spacer()
        }
        .padding(.top, 16)
    }
}
