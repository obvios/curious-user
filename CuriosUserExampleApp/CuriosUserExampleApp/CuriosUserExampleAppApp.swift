//
//  CuriosUserExampleAppApp.swift
//  CuriosUserExampleApp
//
//  Created by Eric Palma on 1/15/25.
//

import SwiftUI
import CuriousUser

@main
struct CuriosUserExampleAppApp: App {
    @StateObject private var sessionManager = SessionManager()

    var body: some Scene {
        WindowGroup {
            // if init state is none, show login
            switch sessionManager.sessionState {
            case .none:
                LoginView()
            case .authenticated, .guest:
                ContentView()
            }
        }.environmentObject(sessionManager) // Add sessionManager to environent
    }
}
