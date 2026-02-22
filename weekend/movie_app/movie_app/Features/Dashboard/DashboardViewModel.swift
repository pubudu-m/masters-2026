//
//  DashboardViewModel.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-15.
//

import Foundation
import Observation

@MainActor
@Observable
class DashboardViewModel {
    var films: [Film]
    var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.films = []
        self.networkService = networkService
    }
    
    func fetchMovies() async {
        do {
            films = try await networkService.fetch(url: "https://ghibliapi.vercel.app/films", type: [Film].self)
        } catch {
            print("Something went wrong")
        }
    }
}
