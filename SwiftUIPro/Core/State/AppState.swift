//
//  AppState.swift
//  SwiftUIPro
//
//  Created by Arohi Magotra on 29/12/25.
//

import Observation

@Observable
@MainActor
final class AppState {
    var isAuthenticated: Bool = false
}
