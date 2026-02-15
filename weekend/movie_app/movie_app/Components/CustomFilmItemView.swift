//
//  CustomFilmItemView.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-15.
//

import SwiftUI

struct CustomFilmItemView: View {
    let film: Film
    
    var body: some View {
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

#Preview {
    CustomFilmItemView(film: .example)
}
