//
//  NotesListView.swift
//  CuriosUserExampleApp
//
//  Created by Eric Palma on 1/21/25.
//

import SwiftUI
import CuriousUser

struct NotesListView: View {
    @StateObject var notesListModel: NotesListModel
    
    init (sessionManager: SessionManager) {
        _notesListModel = .init(wrappedValue: NotesListModel(manager: sessionManager))
    }

    var body: some View {
        VStack {
            // Notes List
            List(notesListModel.notes) { note in
                VStack(alignment: .leading) {
                    Text(note.title)
                        .font(.headline)
                    Text(note.content)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            
            switch notesListModel.sessionManager.sessionState {
            case .authenticated(_):
                // Add Note Button
                Button(action: notesListModel.addNote) {
                    Text("Add Note")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            case .guest, .none:
                if notesListModel.showUpgradePrompt {
                    UpgradePromptView(
                        title: "Premium Feature",
                        message: "Log in to create more notes.",
                        actionTitle: "Log In"
                    ) {
                        notesListModel.login()
                    }
                } else {
                    // Add Note Button
                    Button(action: notesListModel.addNote) {
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
}
