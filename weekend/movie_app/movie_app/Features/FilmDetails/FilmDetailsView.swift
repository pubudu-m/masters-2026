//
//  FilmDetailsView.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-08.
//

import SwiftUI

struct FilmDetailsView: View {
    let film: Film
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                CustomImageView(url: URL(string: film.bannerImage))
                    .frame(height: 300)
                    .containerRelativeFrame(.horizontal)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(film.title)
                        .font(.title)
                        .bold()
                    
                    gridView
                    
                    Divider()
                    
                    Text("Description")
                        .font(.headline)
                    
                    Text(film.description)
                }
                .padding()
            }
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
}

#Preview {
    FilmDetailsView(film: .example)
}
