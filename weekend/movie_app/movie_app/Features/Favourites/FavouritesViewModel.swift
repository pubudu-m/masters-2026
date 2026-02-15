//
//  FavouritesViewModel.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-15.
//

import Foundation
import Observation

@MainActor
@Observable
class FavouritesViewModel {
    var savedFilmIDs: [String] = []
    private let userDefaultsKey = "FavouriteFilms"
    
    var localDataStoreService: LocalDataStorageService
    
    init(localDataStoreService: LocalDataStorageService) {
        self.localDataStoreService = localDataStoreService
        loadData()
    }
    
    func loadData() {
        savedFilmIDs = localDataStoreService.load()
    }
    
    func saveData() {
        localDataStoreService.save(data: [])
    }
}
