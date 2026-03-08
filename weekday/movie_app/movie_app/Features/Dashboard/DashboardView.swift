//
//  DashboardView.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-12.
//

import SwiftUI

struct DashboardView: View {
    var viewModel: DashboardViewModel
    
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .idle:
                    Text("No films yet")
                
                case .loading:
                    ProgressView {
                        Text("Loading...")
                    }
                    
                case .success(let fetchData):
                    createFilms(films: fetchData)
                
                case .failure(let errorMsg):
                    Text(errorMsg)
                        .foregroundStyle(.red)
                }
            }
            .task {
                await viewModel.fetchMovies()
            }
            .navigationDestination(for: Film.self) { film in
                FilmDetailsView(film: film)
            }
        }
    }
    
    private func createFilms(films: [Film]) -> some View {
        List(films) { film in
            NavigationLink(value: film) {
                CustomFilmItemView(film: film)
            }
        }
    }
}

#Preview {
    NavigationStack {
        DashboardView(viewModel: DashboardViewModel())
    }
}
