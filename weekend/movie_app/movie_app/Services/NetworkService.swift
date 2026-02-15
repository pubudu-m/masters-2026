//
//  NetworkService.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-15.
//

import Foundation

struct NetworkService {
    func fetchMovies() async -> [Film] {
        guard let url = URL(string: "https://ghibliapi.vercel.app/films") else {
            return []
        }
        
        do {
            let (data, urlResponse) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = urlResponse as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Invalid http response")
                return []
            }
            
            return try JSONDecoder().decode([Film].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
        
        return []
    }
}
