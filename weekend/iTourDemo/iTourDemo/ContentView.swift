//
//  ContentView.swift
//  iTourDemo
//
//  Created by Pubudu Mihiranga on 2026-03-08.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var path = [Destination]()
    @State private var sortOrder = SortDescriptor(\Destination.name)
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            DestinationListView(sort: sortOrder, searchString: searchText)
                .toolbar {
                    Button("Add Destination", systemImage: "plus") {
                        addDestination()
                    }
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name").tag(SortDescriptor(\Destination.name))
                            Text("Priority").tag(SortDescriptor(\Destination.priority))
                            Text("Date").tag(SortDescriptor(\Destination.date))
                        }
                    }
                }
                .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
                .searchable(text: $searchText)
        }
    }
    
    func addDestination() {
        let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
    }
}

#Preview {
    ContentView()
}
