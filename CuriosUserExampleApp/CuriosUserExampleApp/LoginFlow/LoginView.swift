//
//  LoginView.swift
//  CuriosUserExampleApp
//
//  Created by Eric Palma on 1/23/25.
//

import SwiftUI
import CuriousUser

struct LoginView: View {
    @EnvironmentObject var sessionManager: SessionManager

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to the App")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()

            Text("Please log in or continue as a guest.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)

            Button(action: {
                // Simulate a login
                let user = User(id: "123", name: "John Doe", email: "john.doe@example.com")
                sessionManager.logIn(user: user)
            }) {
                Text("Log In")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)

            Button(action: {
                // Skip login and use the app as a guest
                sessionManager.logOut() // Set the state to guest
            }) {
                Text("Continue as Guest")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .foregroundColor(.blue)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}
