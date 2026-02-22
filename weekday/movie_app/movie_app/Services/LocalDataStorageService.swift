//
//  LocalDataStorageService.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-19.
//

import Foundation

struct LocalDataStorageService {
    let userDefaultsKey = "FavouriteFilms"
    
    func load() -> [String] {
        return UserDefaults.standard.stringArray(forKey: userDefaultsKey) ?? []
    }
    
    func save(data: [String]) {
        UserDefaults.standard.set(data, forKey: userDefaultsKey)
    }
}
