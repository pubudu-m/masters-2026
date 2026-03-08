//
//  FavouritesView.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-12.
//

import SwiftUI

struct FavouritesView: View {
    var dashboardViewModel: DashboardViewModel
    var favouritesViewModel: FavouritesViewModel
    
    var favouriteFilms: [Film] {
        switch dashboardViewModel.state {
        case .success(let fetchData):
            return fetchData.filter { favouritesViewModel.savedFilmIDs.contains($0.id) }
        default:
            return []
        }
    }
    
    var body: some View {
        NavigationStack {
            List(favouriteFilms) { film in
                NavigationLink(value: film) {
                    CustomFilmItemView(film: film)
                }
            }
            .navigationDestination(for: Film.self) { film in
                FilmDetailsView(film: film)
            }
            .onAppear {
                favouritesViewModel.loadData()
            }
        }
    }
}

#Preview {
    FavouritesView(dashboardViewModel: DashboardViewModel(), favouritesViewModel: FavouritesViewModel())
}
