//
//  NotesListModel.swift
//  CuriosUserExampleApp
//
//  Created by Eric Palma on 1/21/25.
//

import Foundation
import CuriousUser

@MainActor
class NotesListModel: ObservableObject {
    @Published var notes: [Note] = []
    @Published var showUpgradePrompt: Bool = false
    let sessionManager: SessionManager
    private let guestNoteLimit = 5
    private var isGuestOverLimit: Bool {
        if case .guest = sessionManager.sessionState {
            return notes.count >= guestNoteLimit
        }
        return false
    }
    
    init(manager: SessionManager) {
        self.sessionManager = manager
    }
    
    func addNote() {
        if isGuestOverLimit {
            showUpgradePrompt = true
        } else {
            let newNote = Note(title: "New Note \(notes.count + 1)", content: "This is a new note.")
            notes.append(newNote)
        }
    }
    
    func login() {
        let user = User(id: "123", name: "John Doe", email: "john@example.com")
        sessionManager.logIn(user: user)
        showUpgradePrompt = false
    }
}
