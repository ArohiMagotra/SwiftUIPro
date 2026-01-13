//
//  SwiftUIProApp.swift
//  SwiftUIPro
//
//  Created by Arohi Magotra on 29/12/25.
//

import SwiftUI

@main
struct SwiftUIProApp: App {
    @State private var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            AppRootView()
                .environment(coordinator)
        }
    }
}

