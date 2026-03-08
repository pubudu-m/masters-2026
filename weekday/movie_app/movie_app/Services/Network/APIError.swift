//
//  APIError.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-26.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case invalidResponse
    case decoding
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid"
        case .invalidResponse:
            return "The response is invalid"
        case .decoding:
            return "Failed to decode the response."
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
