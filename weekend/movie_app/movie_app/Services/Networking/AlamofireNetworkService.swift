//
//  AlamofireNetworkService.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-22.
//

import Alamofire

@MainActor
class AlamofireNetworkService: NetworkService {
    func fetch<T: Decodable>(url: String, type: T.Type) async throws -> T {
        do {
            try? await Task.sleep(nanoseconds: 1000_000_000)
            return try await AF.request(url).serializingDecodable(T.self).value
        } catch let error as AFError {
            if error.isInvalidURLError {
                throw APIError.invalidURL
            } else if error.isResponseSerializationError {
                throw APIError.decoding
            } else {
                throw APIError.networkError
            }
        } catch {
            throw APIError.networkError
        }
    }
}
