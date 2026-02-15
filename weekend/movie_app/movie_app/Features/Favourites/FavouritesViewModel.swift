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
    
    init() {
        loadSavedFilms()
    }
    
    private func loadSavedFilms() {
        savedFilmIDs = UserDefaults.standard.stringArray(forKey: userDefaultsKey) ?? []
    }
}
