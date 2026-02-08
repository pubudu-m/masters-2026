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
                AsyncImage(url: URL(string: film.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .clipped()
                    case .failure(let error):
                        Text(error.localizedDescription)
                    }
                    
                }
                .frame(height: 300)
                .containerRelativeFrame(.horizontal)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(film.title)
                        .font(.title)
                        .bold()
                    
                    Grid(alignment: .leading) {
                        GridRow {
                            Text("Director")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .frame(width: 100, alignment: .leading)
                            
                            Text(film.director)
                                .font(.subheadline)
                        }
                        
                        GridRow {
                            Text("Producer")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .frame(width: 100, alignment: .leading)
                            
                            Text(film.producer)
                                .font(.subheadline)
                        }
                        
                        GridRow {
                            Text("Running time")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .frame(width: 100, alignment: .leading)
                            
                            Text("\(film.duration) minutes")
                                .font(.subheadline)
                        }
                        
                        GridRow {
                            Text("Score")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .frame(width: 100, alignment: .leading)
                            
                            Text("\(film.score)/100")
                                .font(.subheadline)
                        }
                        
                        GridRow {
                            Text("Release Data")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .frame(width: 100, alignment: .leading)
                            
                            Text(film.releaseDate)
                                .font(.subheadline)
                        }
                    }
                    
                    Divider()
                    
                    Text("Description")
                        .font(.subheadline)
                    
                    Text(film.description)
                }
                .padding()
            }
        }
    }
}

#Preview {
    FilmDetailsView(film: .example)
}
