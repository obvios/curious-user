# CuriousUser

CuriousUser is a lightweight Swift library that allows iOS developers to support guest user sessions in their apps. It provides tools to manage guest and authenticated user states, gate features based on user session, and prompt users to upgrade when needed.

## Features

- **Session Management**: Easily manage guest and authenticated user sessions.
- **Feature Access Control**: Gate features based on user session state.
- **Upgrade Prompt**: A customizable SwiftUI view to prompt guest users to sign up or log in.
- **Designed for SwiftUI**: Optimized for SwiftUI apps with iOS 17+ support.

---

## Installation

### Using Swift Package Manager

1. Open your Xcode project.
2. Go to **File > Add Packages**.
3. Enter the URL of this repository: `https://github.com/your-username/CuriousUser.git`.
4. Select the latest version and add it to your project.

Alternatively, you can add it directly to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/your-username/CuriousUser.git", from: "1.0.0")
]
```

## Usage

### 1. Initialize the `SessionManager`

```swift
import CuriousUser

let sessionManager = SessionManager()
```

### 2. Define Features

```swift
let features = [
    Feature(id: "browse_catalog", name: "Browse Catalog", accessLevel: .guest),
    Feature(id: "premium_insights", name: "Premium Insights", accessLevel: .authenticated)
]
```

### 3. Check Feature Access

```swift
let featureGateManager = FeatureGateManager(sessionManager: sessionManager, features: features)

if featureGateManager.isFeatureAccessible(featureID: "premium_insights") {
    print("Feature is accessible")
} else {
    print("Feature requires login")
}
```

### 4. Use `UpgradePromptView`

```swift
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sessionManager: SessionManager

    var body: some View {
        if case .authenticated = sessionManager.sessionState {
            Text("Welcome to Premium Features!")
        } else {
            UpgradePromptView(
                title: "Premium Feature",
                message: "Log in to unlock premium content.",
                actionTitle: "Log In"
            ) {
                print("Redirect to login or sign-up screen")
            }
        }
    }
}
```

# Requirements

- iOS 17+
- Swift 5.7+

# Contributing

Contributions are welcome! Feel free to submit issues or pull requests to help improve the library.

# License

This project is licensed under the MIT License. See the LICENSE file for details.
