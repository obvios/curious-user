import Foundation

/// Manages the user's session state (guest or authenticated).
public final class SessionManager: ObservableObject {
    @Published public private(set) var sessionState: UserSession
    
    /// Initializes the session manager with a specified starting state or defaults to `.none`.
    /// - Parameter initialState: The initial state of the session. Defaults to `.none`.
    public init(initialState: UserSession = .none) {
        self.sessionState = initialState
    }
    
    /// Logs in a user by transitioning to the authenticated state.
    /// - Parameter user: The `User` object representing the authenticated user.
    public func logIn(user: User) {
        sessionState = .authenticated(user)
    }
    
    /// Logs out the current user and transitions to the guest state.
    public func logOut() {
        sessionState = .guest
    }
}
