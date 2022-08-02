//
//  RequestError.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 31.07.22.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .decode:
            return "RequestError.CustomMessage.Decode".localized()
        case .unauthorized:
            return "RequestError.CustomMessage.Unauthorized".localized()
        default:
            return "RequestError.CustomMessage.Default".localized()
        }
    }
}
