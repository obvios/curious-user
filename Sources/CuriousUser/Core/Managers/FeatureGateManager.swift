import Foundation

/// Determines feature accessibility based on the user's session state.
public final class FeatureGateManager {
    private let sessionManager: SessionManager
    private var featureMap: [String: Feature]
    
    /// Initializes the FeatureGateManager with session information and features.
    /// - Parameters:
    ///   - sessionManager: The `SessionManager` instance managing the user's session state.
    ///   - features: An array of `Feature` objects representing the app's features.
    public init(sessionManager: SessionManager, features: [Feature]) {
        self.sessionManager = sessionManager
        self.featureMap = Dictionary(uniqueKeysWithValues: features.map { ($0.id, $0) })
    }
    
    /// Checks if a feature is accessible based on the user's session state.
    /// - Parameter featureID: The unique identifier of the feature.
    /// - Returns: `true` if the feature is accessible, otherwise `false`.
    public func isFeatureAccessible(featureID: String) -> Bool {
        guard let feature = featureMap[featureID] else { return false }
        
        switch feature.accessLevel {
        case .guest:
            return true
        case .authenticated:
            if case .authenticated = sessionManager.sessionState {
                return true
            } else {
                return false
            }
        }
    }
}
