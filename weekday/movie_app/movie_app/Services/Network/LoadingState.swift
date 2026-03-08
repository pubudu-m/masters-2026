//
//  LoadingState.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-26.
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
        if case .success(let fetchData) = self {
            return fetchData
        } else {
            return nil
        }
    }
    
    var error: String? {
        if case .failure(let errMsg) = self {
            return errMsg
        } else {
            return nil
        }
    }
}
