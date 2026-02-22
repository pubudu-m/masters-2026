//
//  LoadingState.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-22.
//

import Foundation

enum LoadingState<T: Equatable>: Equatable {
    case idle
    case loading
    case success(T)
    case failure(String)
    
    var isLoading: Bool {
        if case .loading = self {
            return true
        } else {
            return false
        }
    }
    
    var data: T? {
        if case .success(let value) = self {
            return value
        } else {
            return nil
        }
    }
    
    var error: String? {
        if case .failure(let message) = self {
            return message
        } else {
            return nil
        }
    }
}
