//
//  TodayApp.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/09.
//

import SwiftUI

@main
struct TodayApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MemoListScene()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
