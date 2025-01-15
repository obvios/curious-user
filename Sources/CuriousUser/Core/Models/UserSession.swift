//
//  File.swift
//  CuriousUser
//
//  Created by Eric Palma on 1/11/25.
//

import Foundation

/// Represents the user's session state.
public enum UserSession {
    case guest
    case authenticated(User)
}

/// A struct representing an authenticated user.
public struct User {
    public let id: String
    public let name: String
    public let email: String?
    
    public init(id: String, name: String, email: String? = nil) {
        self.id = id
        self.name = name
        self.email = email
    }
}
