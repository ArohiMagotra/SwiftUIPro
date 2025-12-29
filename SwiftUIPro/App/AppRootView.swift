//
//  AppRootView.swift
//  SwiftUIPro
//
//  Created by Arohi Magotra on 29/12/25.
//

import SwiftUI

struct AppRootView: View {
    @Environment(AppState.self) private var appState

    var body: some View {
        NavigationStack {
            if appState.isAuthenticated {
                Text("Dashboard")
                    .font(.largeTitle)
            } else {
                Text("Login")
                    .font(.largeTitle)
            }
        }
    }
}
