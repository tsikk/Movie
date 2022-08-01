//
//  MovieCardView.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 31.07.22.
//

import SwiftUI
import Kingfisher

struct MovieCardView: View {
    var movie: Movie
    let firstPath = "https://image.tmdb.org/t/p/w400"
    @State var isFavourite = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(URL(string:firstPath + movie.posterPath))
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
                    print("tapped on star")
                    isFavourite.toggle()
                } label: {
                    Image(systemName: isFavourite ? "star.fill" : "star")
                        .foregroundColor(.red)
                }.buttonStyle(.bordered)
                
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

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(movie: .init(backdropPath: "/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg",
                                   id: 278,
                                   overview: "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
                                   popularity: 81.971,
                                   posterPath: "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
                                   releaseDate: "1994-09-23",
                                   title: "The Shawshank Redemption",
                                   voteAverage: 8.7,
                                   voteCount: 21896))
    }
}
