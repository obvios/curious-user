//
//  SwiftUIView.swift
//  CuriousUser
//
//  Created by Eric Palma on 1/11/25.
//

import SwiftUI

/// A SwiftUI view prompting users to upgrade to an authenticated account.
public struct UpgradePromptView: View {
    public var title: String
    public var message: String
    public var actionTitle: String
    public var onUpgradeTapped: () -> Void
    
    /// Initializes the UpgradePromptView.
    /// - Parameters:
    ///   - title: The title of the prompt.
    ///   - message: The message explaining why the user should upgrade.
    ///   - actionTitle: The title of the upgrade button.
    ///   - onUpgradeTapped: A closure called when the upgrade button is tapped.
    public init(
        title: String = "Upgrade Required",
        message: String = "To access this feature, you need to log in or sign up.",
        actionTitle: String = "Upgrade Now",
        onUpgradeTapped: @escaping () -> Void
    ) {
        self.title = title
        self.message = message
        self.actionTitle = actionTitle
        self.onUpgradeTapped = onUpgradeTapped
    }
    
    public var body: some View {
        VStack(spacing: 16) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            Text(message)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            Button(action: onUpgradeTapped) {
                Text(actionTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .buttonStyle(.plain)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
        )
        .padding()
    }
}


#Preview {
    UpgradePromptView(title: "Upgrade", message: "Unlock full access", actionTitle: "Get Started", onUpgradeTapped: {
        print("get started")
    })
}
