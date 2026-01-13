//
//  AppCoordinator.swift
//  SwiftUIPro
//
//  Created by Arohi Magotra on 13/01/26.
//

import SwiftUI
import Observation

// MARK: - Routes

enum AuthRoute: Hashable, Codable {
    case login
}

enum MainRoute: Hashable, Codable {
    case portfolioDetail(id: UUID)
}

// MARK: - App Flow

enum AppFlow {
    case auth
    case main
}

// MARK: - Coordinator

@Observable
@MainActor
final class AppCoordinator {
    // MARK: - Properties
    
    var appFlow: AppFlow = .auth
    var authPath: [AuthRoute] = []
    var mainPath: [MainRoute] = []
    
    // MARK: - Auth Navigation
    
    func loginSucceeded() {
        appFlow = .main
        authPath.removeAll()
    }
    
    func logout() {
        appFlow = .auth
        mainPath.removeAll()
    }
    
    // MARK: - Main Navigation
    
    func showPortfolioDetail(id: UUID) {
        mainPath.append(.portfolioDetail(id: id))
    }
    
    func dismissDetail() {
        guard !mainPath.isEmpty else { return }
        mainPath.removeLast()
    }
    
    func popToRoot() {
        mainPath.removeAll()
    }
}
