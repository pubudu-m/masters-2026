//
//  DashboardView.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-08.
//

import SwiftUI

struct DashboardView: View {
    @State var films: [Film] = []
    
    var body: some View {
        NavigationStack {
            List(films) { film in
                NavigationLink(value: film) {
                    HStack {
                        CustomImageView(url: URL(string: film.image))
                            .frame(width: 100, height: 150)
                        
                        VStack(alignment: .leading) {
                            Text(film.title)
                                .bold()
                            
                            Text("Directed by \(film.director)")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            
                            Text("Released on \(film.releaseDate)")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .task {
                await fetchMovies()
            }
            .navigationDestination(for: Film.self) { film in
                FilmDetailsView(film: film)
            }
        }
    }
    
    private func fetchMovies() async {
        guard let url = URL(string: "https://ghibliapi.vercel.app/films") else { return }
        
        do {
            let (data, urlResponse) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = urlResponse as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Invalid http response")
                return
            }
            
            films = try JSONDecoder().decode([Film].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    DashboardView()
}
