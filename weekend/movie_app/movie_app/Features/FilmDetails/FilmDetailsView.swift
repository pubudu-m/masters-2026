//
//  FilmDetailsView.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-08.
//

import SwiftUI

struct FilmDetailsView: View {
    let film: Film
    
    @State private var savedFilmIDs: [String] = []
    
    private var isSaved: Bool {
        savedFilmIDs.contains(film.id)
    }
    
    let userDefaultsKey = "FavouriteFilms"
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                CustomImageView(url: URL(string: film.bannerImage))
                    .frame(height: 300)
                    .containerRelativeFrame(.horizontal)
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text(film.title)
                            .font(.title)
                            .bold()
                        
                        Spacer()
                        
                        Button {
                            toggleSaveState()
                        } label: {
                            Image(systemName: isSaved ? "heart.fill" : "heart")
                                .font(.title)
                                .foregroundStyle(.pink)
                        }

                    }
                    
                    gridView
                    
                    Divider()
                    
                    Text("Description")
                        .font(.headline)
                    
                    Text(film.description)
                }
                .padding()
            }
        }
        .onAppear {
            loadSavedFilms()
        }
    }
    
    private var gridView: some View {
        Grid(alignment: .leading) {
            CustomKeyValueView(key: "Director", value: film.director)
            CustomKeyValueView(key: "Producer", value: film.producer)
            CustomKeyValueView(key: "Release Date", value: film.releaseDate)
            CustomKeyValueView(key: "Running time", value: "\(film.duration) minutes")
            CustomKeyValueView(key: "Score", value: "\(film.score)/100")
        }
    }
    
    private func loadSavedFilms() {
        savedFilmIDs = UserDefaults.standard.stringArray(forKey: userDefaultsKey) ?? []
    }
    
    private func toggleSaveState() {
        if isSaved {
            savedFilmIDs.removeAll { $0 == film.id }
        } else {
            savedFilmIDs.append(film.id)
        }
        
        UserDefaults.standard.set(savedFilmIDs, forKey: userDefaultsKey)
    }
}

#Preview {
    FilmDetailsView(film: .example)
}
