//
//  ContentView.swift
//  CuriosUserExampleApp
//
//  Created by Eric Palma on 1/15/25.
//

import SwiftUI
import CuriousUser

struct ContentView: View {
    @EnvironmentObject var sessionManager: SessionManager

    var body: some View {
        if case .authenticated = sessionManager.sessionState {
            Text("Welcome to Premium Features!")
                .padding()
        } else {
            UpgradePromptView(
                title: "Premium Feature",
                message: "Log in to unlock premium content.",
                actionTitle: "Log In"
            ) {
                let user = User(id: "123", name: "John Doe", email: "john@example.com")
                sessionManager.logIn(user: user)
            }
        }
    }
}

#Preview {
    ContentView()
}
