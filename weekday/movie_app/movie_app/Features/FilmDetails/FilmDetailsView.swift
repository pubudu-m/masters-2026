//
//  FilmDetailsView.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-12.
//

import SwiftUI

struct FilmDetailsView: View {
    let film: Film
    
    let userDefaultsKey = "FavouriteFilms"
    @State private var savedFilmIDs: [String] = []
    private var isSaved: Bool {
        savedFilmIDs.contains(film.id)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                CustomImageView(url: URL(string: film.movieBanner))
                    .frame(height: 300)
                    .containerRelativeFrame(.horizontal)
                
                movieData
            }
        }
        .onAppear {
            savedFilmIDs = UserDefaults.standard.stringArray(forKey: userDefaultsKey) ?? []
        }
    }
    
    private var movieData: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(film.title)
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Button {
                    if isSaved {
                        savedFilmIDs.removeAll { $0 == film.id }
                    } else {
                        savedFilmIDs.append(film.id)
                    }
                    
                    UserDefaults.standard.set(savedFilmIDs, forKey: userDefaultsKey)
                } label: {
                    Image(systemName: isSaved ? "heart.fill" : "heart")
                        .font(.title)
                        .foregroundStyle(.pink)
                }
            }
            
            Grid(alignment: .leading) {
                CustomKeyValueView(key: "Director", value: film.director)
                
                CustomKeyValueView(key: "Producer", value: film.producer)
                
                CustomKeyValueView(key: "Release Date", value: film.releaseDate)
                
                CustomKeyValueView(key: "Running Time", value: film.runningTime)
                
                CustomKeyValueView(key: "Score", value: "\(film.score)/100")
                
                GridRow {
                    Text("Director")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .frame(width: 100, alignment: .leading)
                    
                    Text(film.director)
                        .font(.subheadline)
                }
            }
            
            Divider()
            
            Text("Description")
                .font(.headline)
            
            Text(film.description)
                .multilineTextAlignment(.leading)
        }
        .padding()
    }
}

#Preview {
    FilmDetailsView(film: .example)
}
