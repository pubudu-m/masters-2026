//
//  ContentView.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-08.
//

import SwiftUI

struct ContentView: View {
    @State var films: [Film] = []
    
    var body: some View {
        NavigationStack {
            List(films) { film in
                NavigationLink(value: film) {
                    HStack {
                        AsyncImage(url: URL(string: film.image)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                            case .failure(let error):
                                Text(error.localizedDescription)
                            }
                            
                        }
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
                guard let url = URL(string: "https://ghibliapi.vercel.app/films") else { return }
                
                do {
                    let (data, response) = try await URLSession.shared.data(from: url)
                    films = try JSONDecoder().decode([Film].self, from: data)
                } catch {
                    print(error.localizedDescription)
                }
            }
            .navigationDestination(for: Film.self) { film in
                
            }
        }
    }
}

#Preview {
    ContentView()
}
