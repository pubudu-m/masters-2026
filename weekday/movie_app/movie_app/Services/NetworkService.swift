//
//  NetworkService.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-19.
//

import Foundation

struct NetworkService {
    func fetchMovies() async -> [Film] {
        guard let url = URL(string: "https://ghibliapi.vercel.app/films") else {
            print("Invalid URL error")
            return []
        }
        
        do {
            let (data, urlResponse) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = urlResponse as? HTTPURLResponse, (200...300).contains(httpResponse.statusCode) else {
                return []
            }
            
            return try JSONDecoder().decode([Film].self, from: data)
        } catch {
            print("Something went wrong!")
        }
        
        return []
    }
}
