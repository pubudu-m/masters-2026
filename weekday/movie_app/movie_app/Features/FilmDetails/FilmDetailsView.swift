//
//  FilmDetailsView.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-12.
//

import SwiftUI

struct FilmDetailsView: View {
    let film: Film
    
    var body: some View {
        ScrollView {
            VStack {
                CustomImageView(url: URL(string: film.movieBanner))
                    .frame(height: 300)
                    .containerRelativeFrame(.horizontal)
                
                movieData
            }
        }
    }
    
    private var movieData: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(film.title)
                .font(.title)
                .bold()
            
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
