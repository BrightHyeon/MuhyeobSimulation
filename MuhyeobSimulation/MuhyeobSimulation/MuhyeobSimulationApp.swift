//
//  MuhyeobSimulationApp.swift
//  MuhyeobSimulation
//
//  Created by Hyeonsoo Kim on 2022/07/30.
//

import SwiftUI

@main
struct MuhyeobSimulationApp: App {
    
    let persistenceController = PersistenceController.shared
    
    let storyViewModel = StoryViewModel()
    
    var body: some Scene {
        WindowGroup {
            NameView()
                .environmentObject(storyViewModel)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
