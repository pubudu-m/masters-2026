//
//  LocalDataStorageService.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-15.
//

import Foundation

struct LocalDataStorageService {
    let userDefaultsKeyForFavouriteFilms = "FavouriteFilms"
    
    func load() -> [String] {
        return UserDefaults.standard.stringArray(forKey: userDefaultsKeyForFavouriteFilms) ?? []
    }
    
    func save(data: [String]) {
        UserDefaults.standard.set(data, forKey: userDefaultsKeyForFavouriteFilms)
    }
}
