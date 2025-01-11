import Foundation

/// Represents the access level for a feature.
public enum FeatureAccessLevel {
    case guest
    case authenticated
}

/// A struct representing an app feature and its access level.
public struct Feature {
    public let id: String
    public let name: String
    public let accessLevel: FeatureAccessLevel
    
    public init(id: String, name: String, accessLevel: FeatureAccessLevel) {
        self.id = id
        self.name = name
        self.accessLevel = accessLevel
    }
}

