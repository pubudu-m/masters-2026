//
//  NetworkService.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-19.
//

import Foundation

protocol NetworkService {
    func fetch<T: Decodable>(url: String, type: T.Type) async throws -> T
}
