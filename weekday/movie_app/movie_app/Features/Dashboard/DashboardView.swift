//
//  DashboardView.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-12.
//

import SwiftUI

struct DashboardView: View {
    @State private var films: [Film] = []
    
    var body: some View {
        NavigationStack {
            List(films) { film in
                NavigationLink(value: film) {
                    HStack {
                        CustomImageView(url: URL(string: film.image))
                            .frame(width: 100, height: 150)
                        
                        VStack(alignment: .leading) {
                            Text(film.title)
                                .font(.title3)
                                .bold()
                            
                            Text("Directed by \(film.director)")
                                .font(.body)
                                .foregroundStyle(.secondary)
                            
                            Text("Released on \(film.releaseDate)")
                                .font(.footnote)
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
    
    func fetchMovies() async {
        guard let url = URL(string: "https://ghibliapi.vercel.app/films") else {
            print("Invalid URL error")
            return
        }
        
        do {
            let (data, urlResponse) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = urlResponse as? HTTPURLResponse, (200...300).contains(httpResponse.statusCode) else {
                return
            }
            
            films = try JSONDecoder().decode([Film].self, from: data)
        } catch {
            print("Something went wrong!")
        }
    }
}

#Preview {
    NavigationStack {
        DashboardView()
    }
}
