//
//  CustomImageView.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-08.
//

import SwiftUI

struct CustomImageView: View {
    let url: URL?
        
    var body: some View {
        AsyncImage(url: url) { phase in
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
    }
}

#Preview {
    CustomImageView(url: URL(string: "https://image.tmdb.org/t/p/w533_and_h300_bestv2/3cyjYtLWCBE1uvWINHFsFnE8LUK.jpg"))
        .frame(width: 200, height: 300)
}
