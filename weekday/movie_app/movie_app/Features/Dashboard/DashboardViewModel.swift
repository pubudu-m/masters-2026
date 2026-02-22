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
    var films: [Film]
    var networkService: NetworkService
    
    init() {
        self.films = []
        self.networkService = NetworkService()
    }
    
    func fetchMovies() async {
        films = await networkService.fetchMovies()
    }
}
