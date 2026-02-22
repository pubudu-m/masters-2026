//
//  TabBarView.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-12.
//

import SwiftUI

struct TabBarView: View {
    @State private var dashboardViewModel = DashboardViewModel()
    @State private var favouritesViewModel = FavouritesViewModel()
    
    var body: some View {
        TabView {
            DashboardView(viewModel: dashboardViewModel)
                .tabItem {
                    Label("Dashboard", systemImage: "house")
                }
            
            FavouritesView(dashboardViewModel: dashboardViewModel, favouritesViewModel: favouritesViewModel)
                .tabItem {
                    Label("Favourites", systemImage: "heart")
                }
        }
    }
}

#Preview {
    TabBarView()
}
