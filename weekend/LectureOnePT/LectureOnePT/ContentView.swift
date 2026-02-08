//
//  ContentView.swift
//  LectureOnePT
//
//  Created by Pubudu Mihiranga on 2026-02-01.
//

import SwiftUI

struct ContentView: View {
    // CountStore - display count
    @Environment(CountStore.self) var countStore
    @State private var showMySheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("First Screen")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.brown)
                
                Text("\(countStore.count)")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.gray)
                
                NavigationLink("Go to second view") {
                    SecondView()
                }
            }
            .padding()
            .navigationTitle("First")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showMySheet = true
                    } label: {
                        Image(systemName: "gear")
                    }

                }
            }
            .sheet(isPresented: $showMySheet) {
                MySheetView()
            }
        }
    }
}

struct MySheetView: View {
    @Environment(\.dismiss) var dimissView
    
    var body: some View {
        VStack {
            Text("Sheet View")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.brown)
            
            Button("Dismiss sheet") {
                dimissView()
            }
        }
    }
}

struct SecondView: View {
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.brown)
            
            NavigationLink("Go to thrid view") {
                ThirdView()
            }
        }
        .padding()
        .navigationTitle("Second")
    }
}

struct ThirdView: View {
    @Environment(CountStore.self) var countStore
    
    var body: some View {
        VStack {
            Text("Third View")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.brown)
            
            Button("Update count") {
                // CountStore - incrementCountValue
                countStore.incrementCountValue()
            }
        }
        .padding()
        .navigationTitle("Third")
    }
}

#Preview {
    ContentView()
        .environment(CountStore())
}
