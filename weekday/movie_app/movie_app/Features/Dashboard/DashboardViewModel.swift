//
//  DashboardViewModel.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-19.
//

import Foundation
import Observation

@MainActor
@Observable
class DashboardViewModel {
    var state: LoadingState<[Film]> = .idle
    var networkService: NetworkService
    
    init() {
        self.networkService = AlamofireNetworkService()
    }
    
    func fetchMovies() async {
        state = .loading
        
        do {
            let films = try await networkService.fetch(url: "https://ghibliapi.vercel.app/films", type: [Film].self)
            state = .success(films)
        } catch {
            state = .failure(error.localizedDescription)
        }
    }
}
