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
            List(dashboardViewModel.films) { film in
                NavigationLink(value: film) {
                    CustomFilmItemView(film: film)
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
}

#Preview {
    DashboardView(dashboardViewModel: DashboardViewModel(networkService: MyNetworkService()),
                  favouritesViewModel: FavouritesViewModel(localDataStoreService: LocalDataStorageService()))
}
