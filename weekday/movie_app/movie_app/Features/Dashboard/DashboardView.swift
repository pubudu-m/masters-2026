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
            List(viewModel.films) { film in
                NavigationLink(value: film) {
                    CustomFilmItemView(film: film)
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
}

#Preview {
    NavigationStack {
        DashboardView(viewModel: DashboardViewModel())
    }
}
