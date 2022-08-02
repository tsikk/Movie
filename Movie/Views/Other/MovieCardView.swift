//
//  MovieCardView.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 31.07.22.
//

import SwiftUI
import Kingfisher

struct MovieCardView: View {
    var movie: MoviesModel
    var viewModel: BaseViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(URL(string: movie.bannerURL))
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxHeight: Constants.ImageHeight)
            HStack {
                Text(movie.title)
                    .bold()
                Spacer()
                
                Button {
                    viewModel.tappedOnFavourite(movie: movie)
                } label: {
                    Image(systemName: movie.isFavourite ? "star.fill" : "star")
                        .foregroundColor(.tabBarColor)
                }.buttonStyle(.plain)
                
            }
            .padding()
            .background(.thinMaterial)
        }
        .background(.thickMaterial)
        .mask(RoundedRectangle(cornerRadius: Constants.MediumCornerRadius))
        .padding(Constants.CardViewPaddings)
    }
    
    private enum Constants {
        static let CardViewPaddings: CGFloat = 8
        static let MediumCornerRadius: CGFloat = 16
        static let ImageHeight: CGFloat = 400
    }
}
