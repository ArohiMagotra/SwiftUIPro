//
//  AuthRootView.swift
//  SwiftUIPro
//
//  Created by Arohi Magotra on 13/01/26.
//

import SwiftUI

struct AuthRootView: View {
    @Environment(AppCoordinator.self) private var coordinator

    var body: some View {
        @Bindable var coordinator = coordinator
        
        NavigationStack(path: $coordinator.authPath) {
            LoginView()
                .navigationDestination(for: AuthRoute.self) { route in
                    switch route {
                    case .login:
                        LoginView()
                    }
                }
        }
    }
}

#Preview {
    AuthRootView()
        .environment(AppCoordinator())
}
