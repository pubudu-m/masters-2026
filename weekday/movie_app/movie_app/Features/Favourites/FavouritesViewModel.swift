//
//  FavouritesViewModel.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-19.
//

import Foundation
import Observation

@MainActor
@Observable
class FavouritesViewModel {
    var savedFilmIDs: [String]
    var localDataStorageService: LocalDataStorageService
    
    init() {
        self.savedFilmIDs = []
        self.localDataStorageService = LocalDataStorageService()
    }
    
    func loadData() {
        savedFilmIDs = localDataStorageService.load()
    }
    
    func saveData() {
        localDataStorageService.save(data: [])
    }
}
