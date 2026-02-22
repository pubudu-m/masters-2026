//
//  TabBarView.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-08.
//

import SwiftUI

struct TabBarView: View {
    @State var dashboardViewModel = DashboardViewModel(networkService: AlamofireNetworkService())
    @State var favouritesViewModel = FavouritesViewModel(localDataStoreService: LocalDataStorageService())
    
    var body: some View {
        TabView {
            DashboardView(dashboardViewModel: dashboardViewModel,
                          favouritesViewModel: favouritesViewModel)
                .tabItem {
                    Label("Dashboard", systemImage: "house")
                }
            
            FavouritesView(dashboardViewModel: dashboardViewModel,
                           favouritesViewModel: favouritesViewModel)
                .tabItem {
                    Label("Favourites", systemImage: "heart")
                }
        }
    }
}

#Preview {
    TabBarView()
}
