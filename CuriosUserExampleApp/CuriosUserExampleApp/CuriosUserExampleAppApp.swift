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
            ContentView()
                .environmentObject(sessionManager)
        }
    }
}
