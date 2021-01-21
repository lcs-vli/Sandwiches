//
//  SandwichesApp.swift
//  Shared
//
//  Created by Li, Muchen on 2021/1/20.
//

import SwiftUI

@main
struct SandwichesApp: App {
    @StateObject private var store = SandwichStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
