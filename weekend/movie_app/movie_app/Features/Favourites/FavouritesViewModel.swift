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
    var savedFilmIDs: Set<String> = []
    private let userDefaultsKey = "FavouriteFilms"
    
    var localDataStoreService: DataStorageService
    
    init(localDataStoreService: DataStorageService) {
        self.localDataStoreService = localDataStoreService
        loadData()
    }
    
    func loadData() {
        savedFilmIDs = localDataStoreService.load()
    }
    
    func saveData() {
        localDataStoreService.save(data: savedFilmIDs)
    }
    
    func isSaved(filmId: String) -> Bool {
        return savedFilmIDs.contains(filmId)
    }
    
    func toggleSaveState(filmId: String) {
        if savedFilmIDs.contains(filmId) {
            savedFilmIDs.remove(filmId)
        } else {
            savedFilmIDs.insert(filmId)
        }
        
        saveData()
    }
}
