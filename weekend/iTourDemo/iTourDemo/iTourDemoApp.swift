//
//  iTourDemoApp.swift
//  iTourDemo
//
//  Created by Pubudu Mihiranga on 2026-03-08.
//

import SwiftUI
import SwiftData

@main
struct iTourDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
    }
}
