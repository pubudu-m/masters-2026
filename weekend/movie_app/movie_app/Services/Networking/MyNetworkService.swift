//
//  MyNetworkService.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-22.
//

import SwiftUI

@MainActor
class MyNetworkService: NetworkService {
    func fetch<T: Decodable>(url: String, type: T.Type) async throws -> T {
        guard let url = URL(string: url) else {
            throw APIError.invalidURL
        }
        
        do {
            let (data, urlResponse) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = urlResponse as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw APIError.invalidResponse
            }
            
            return try JSONDecoder().decode(type, from: data)
        } catch let error as DecodingError {
            throw APIError.decoding
        } catch {
            throw APIError.networkError
        }
    }
}
