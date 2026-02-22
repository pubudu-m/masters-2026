//
//  DashboardView.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-08.
//

import SwiftUI

struct DashboardView: View {
    var dashboardViewModel: DashboardViewModel
    var favouritesViewModel: FavouritesViewModel
    
    var body: some View {
        NavigationStack {
            Group {
                switch dashboardViewModel.state {
                case .idle:
                    Text("No films yet")
                    
                case .loading:
                    ProgressView {
                        Text("Loading...")
                    }
                    
                case .success(let films):
                    createFilms(films: films)
                    
                case .failure(let errorMsg):
                    Text(errorMsg)
                        .foregroundStyle(.red)
                }
            }
            .task {
                await dashboardViewModel.fetchMovies()
            }
            .navigationTitle("My Movies")
            .navigationDestination(for: Film.self) { film in
                FilmDetailsView(film: film, favouritesViewModel: favouritesViewModel)
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
    DashboardView(dashboardViewModel: DashboardViewModel(networkService: MyNetworkService()),
                  favouritesViewModel: FavouritesViewModel(localDataStoreService: LocalDataStorageService()))
}
