//
//  LocalDataStorageService.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-15.
//

import Foundation

protocol DataStorageService {
    func load() -> Set<String>
    func save(data: Set<String>)
}

struct LocalDataStorageService: DataStorageService {
    let userDefaultsKeyForFavouriteFilms = "FavouriteFilms"
    
    func load() -> Set<String> {
        let array = UserDefaults.standard.stringArray(forKey: userDefaultsKeyForFavouriteFilms) ?? []
        return Set(array)
    }
    
    func save(data: Set<String>) {
        UserDefaults.standard.set(data, forKey: userDefaultsKeyForFavouriteFilms)
    }
}

struct SwiftDataStorageService: DataStorageService {
    func load() -> Set<String> {
        return []
    }
    
    func save(data: Set<String>) {
        
    }
}
