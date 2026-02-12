//
//  CustomKeyValueView.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-12.
//

import SwiftUI

struct CustomKeyValueView: View {
    let key: String
    let value: String
    
    var body: some View {
        GridRow {
            Text(key)
                .font(.subheadline)
                .fontWeight(.medium)
                .frame(width: 100, alignment: .leading)
            
            Text(value)
                .font(.subheadline)
        }
    }
}

#Preview {
    CustomKeyValueView(key: "Producer", value: "Isao Takahata")
}
