//
//  MainRootView.swift
//  SwiftUIPro
//
//  Created by Arohi Magotra on 13/01/26.
//

import SwiftUI

struct MainRootView: View {
    @Environment(AppCoordinator.self) private var coordinator

    var body: some View {
        @Bindable var coordinator = coordinator
        
        NavigationStack(path: $coordinator.mainPath) {
            PortfolioListView()
                .navigationTitle("Portfolio")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            coordinator.logout()
                        } label: {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                        }
                    }
                }
        }
        .navigationDestination(for: MainRoute.self) { route in
            switch route {
            case .portfolioDetail(let id):
               EmptyView()
            }
        }
    }
}

#Preview {
    let coordinator = AppCoordinator()
    coordinator.appFlow = .main
    
    return MainRootView()
        .environment(coordinator)
}
