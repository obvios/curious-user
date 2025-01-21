//
//  NotesListView.swift
//  CuriosUserExampleApp
//
//  Created by Eric Palma on 1/21/25.
//

import SwiftUI
import CuriousUser

struct NotesListView: View {
    @EnvironmentObject var sessionManager: SessionManager
    @State private var notes: [Note] = []
    @State private var showUpgradePrompt = false

    private let guestNoteLimit = 5

    var body: some View {
        VStack {
            // Notes List
            List(notes) { note in
                VStack(alignment: .leading) {
                    Text(note.title)
                        .font(.headline)
                    Text(note.content)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            
            switch sessionManager.sessionState {
            case .authenticated(_):
                // Add Note Button
                Button(action: addNote) {
                    Text("Add Note")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            case .guest:
                if showUpgradePrompt {
                    UpgradePromptView(
                        title: "Premium Feature",
                        message: "Log in to unlock premium content.",
                        actionTitle: "Log In"
                    ) {
                        let user = User(id: "123", name: "John Doe", email: "john@example.com")
                        sessionManager.logIn(user: user)
                    }
                } else {
                    // Add Note Button
                    Button(action: addNote) {
                        Text("Add Note")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("My Notes")
    }

    private var isGuestOverLimit: Bool {
        if case .guest = sessionManager.sessionState {
            return notes.count >= guestNoteLimit
        }
        return false
    }

    private func addNote() {
        if isGuestOverLimit {
            showUpgradePrompt = true
        } else {
            let newNote = Note(title: "New Note \(notes.count + 1)", content: "This is a new note.")
            notes.append(newNote)
        }
    }
}

#Preview {
    NotesListView()
}
