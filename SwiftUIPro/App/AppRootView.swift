//
//  AppRootView.swift
//  SwiftUIPro
//
//  Created by Arohi Magotra on 29/12/25.
//

import SwiftUI

struct AppRootView: View {
    @Environment(AppCoordinator.self) private var coordinator

    var body: some View {
        switch coordinator.appFlow {
        case .auth:
            AuthRootView()
        case .main:
            MainRootView()
        }
    }
}

#Preview {
    AppRootView()
        .environment(AppCoordinator())
}

