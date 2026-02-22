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
    var networkService: NetworkService
    var state: LoadingState<[Film]> = .idle
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchMovies() async {
        state = .loading
        
        do {
            let films = try await networkService.fetch(url: "https://ghibliapi.vercel.app/films", type: [Film].self)
            state = .success(films)
        } catch {
            state = .failure("Something went wrong")
        }
    }
}
