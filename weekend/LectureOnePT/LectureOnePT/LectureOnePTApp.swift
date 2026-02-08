//
//  LectureOnePTApp.swift
//  LectureOnePT
//
//  Created by Pubudu Mihiranga on 2026-02-01.
//

import SwiftUI
import Observation

@Observable
class CountStore {
    var count: Int = 0
    
    func incrementCountValue() {
        count += 1
    }
}

@main
struct LectureOnePTApp: App {
    let countStore = CountStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(countStore)
        }
    }
}
