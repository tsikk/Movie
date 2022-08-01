//
//  Movie.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 31.07.22.
//

import Foundation

struct Movie: Decodable, Hashable {
    let backdropPath: String
    let id: Int
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case overview
        case popularity
        case id
        case title
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

extension Movie {
    func convertedReleaseDate() -> String? {
        // original format: yyyy-MM-dd
        let originalDateString = releaseDate
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let originalDate = dateFormatter.date(from: originalDateString) else { return nil }
        
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: originalDate)
    }
    
}
