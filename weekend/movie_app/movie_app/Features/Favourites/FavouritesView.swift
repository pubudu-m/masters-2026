//
//  FavouritesView.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-08.
//

import SwiftUI

struct FavouritesView: View {
    var dashboardViewModel: DashboardViewModel
    var favouritesViewModel: FavouritesViewModel
    
    var favoriteFilms: [Film] {
        dashboardViewModel.films.filter { favouritesViewModel.savedFilmIDs.contains($0.id) }
    }
    
    var body: some View {
        NavigationStack {
            List(favoriteFilms) { film in
                NavigationLink(value: film) {
                    CustomFilmItemView(film: film)
                }
            }
            .navigationDestination(for: Film.self) { film in
                FilmDetailsView(film: film, favouritesViewModel: favouritesViewModel)
            }
        }
    }
}

#Preview {
    FavouritesView(dashboardViewModel: DashboardViewModel(networkService: MyNetworkService()),
                   favouritesViewModel: FavouritesViewModel(localDataStoreService: LocalDataStorageService()))
}
