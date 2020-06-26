//
//  Book_ClubApp.swift
//  Shared
//
//  Created by RANGA REDDY NUKALA on 25/06/20.
//

import SwiftUI

@main
struct Book_ClubApp: App {
    @StateObject private var store = ReadingListStore()
    
    var body: some Scene {
        WindowGroup {
            ReadingListViewer(store: store)
        }
    }
}
