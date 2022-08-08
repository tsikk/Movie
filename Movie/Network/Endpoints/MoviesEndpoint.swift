//
//  MoviesEndpoint.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 31.07.22.
//

import Foundation

enum MoviesEndpoint {
    case topRated
    case movieDetail(id: Int)
}

extension MoviesEndpoint: Endpoint {
    var path: String {
        switch self {
        case .topRated:
            return "/3/movie/top_rated"
        case .movieDetail(let id):
            return "/3/movie/\(id)"
        }
    }

    var method: RequestMethod {
        switch self {
        case .topRated, .movieDetail:
            return .get
        }
    }

    var header: [String: String]? {
        let accessToken = "5ce75b33377ea321b6fad2bee7baba1e"
        switch self {
        case .topRated, .movieDetail:
            return [
                "Content-Type": "application/json;charset=utf-8",
                "Authorization": "\(accessToken)"
            ]
        }
    }
    
    var body: [String: String]? {
        switch self {
        case .topRated, .movieDetail:
            return nil
        }
    }
    
    var queryItem: [URLQueryItem]? {
        let accessToken = "5ce75b33377ea321b6fad2bee7baba1e"
        switch self {
        case .topRated, .movieDetail:
            let queryItemToken = URLQueryItem(name: "api_key", value: "\(accessToken)")
            let queryItemQuery = URLQueryItem(name: "", value: "")
            return [queryItemToken, queryItemQuery]
        }
    }
}
