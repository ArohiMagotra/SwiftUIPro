//
//  PortfolioListView.swift
//  SwiftUIPro
//
//  Created by Arohi Magotra on 04/01/26.
//

import SwiftUI

struct PortfolioListView: View {
    @Environment(AppCoordinator.self) private var coordinator
    
    @State private var portfolios: [Portfolio] = [
        Portfolio(id: UUID(), name: "Apple"),
        Portfolio(id: UUID(), name: "Tesla"),
        Portfolio(id: UUID(), name: "NVIDIA")
    ]

    var body: some View {
        List(portfolios) { portfolio in
            Button {
                coordinator.showPortfolioDetail(id: portfolio.id)
            } label: {
                PortfolioRow(model: portfolio)
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    NavigationStack {
        PortfolioListView()
            .navigationTitle("Portfolio")
    }
    .environment(AppCoordinator())
}
