//
//  SwiftUIProApp.swift
//  SwiftUIPro
//
//  Created by Arohi Magotra on 29/12/25.
//

import SwiftUI

@main
struct SwiftUIProApp: App {
    @State private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            AppRootView()
                .environment(appState)
        }
    }
}

