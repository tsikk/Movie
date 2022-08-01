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
                    RatingView(rating: viewModel.movie.voteCount)
                    Spacer()
                    Image(systemName: "star")
                }
                .padding(8)
                .background(.thinMaterial)
            }
            .background(.thickMaterial)
            .mask(RoundedRectangle(cornerRadius: 16))
            
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Release Date: \(viewModel.movie.releaseDate)")
                    .bold()
                    .font(.headline)
                    .foregroundColor(.white)
                
                ScrollView {
                    Text(viewModel.movie.overview)
                        .bold()
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding()
            
            Spacer()
        }
        .padding(.top, 16)
    }
}

//struct SelectedMovieContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectedMovieContentView(viewModel: SelectedMovieViewModel(with: .init(backdropPath: "/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg",
//                  id: 278,
//                  overview: "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
//                  popularity: 81.971,
//                  posterPath: "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
//                  releaseDate: "1994-09-23",
//                  title: "The Shawshank Redemption",
//                  voteAverage: 8.7,
//                  voteCount: 21896)))
//    }
//}
