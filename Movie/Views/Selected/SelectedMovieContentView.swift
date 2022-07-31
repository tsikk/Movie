//
//  SelectedMovieContentView.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 31.07.22.
//

import SwiftUI

struct SelectedMovieContentView: View {
    @ObservedObject var viewModel: SelectedMovieViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Text(viewModel.movie.title)
                .bold()
                .font(.title)
                .foregroundColor(.red)
            Spacer()
            Text(viewModel.movie.overview)
                .bold()
                .font(.callout)
                .foregroundColor(.red)
            Spacer()
            Text(viewModel.movie.releaseDate)
                .bold()
                .font(.headline)
                .foregroundColor(.red)
            Spacer()
            Spacer()
        }
        
    }
}

struct SelectedMovieContentView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedMovieContentView(viewModel: SelectedMovieViewModel(with: .init(backdropPath: "/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg",
                  id: 278,
                  overview: "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
                  popularity: 81.971,
                  posterPath: "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
                  releaseDate: "1994-09-23",
                  title: "The Shawshank Redemption",
                  voteAverage: 8.7,
                  voteCount: 21896)))
    }
}
