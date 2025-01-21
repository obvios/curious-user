//
//  ContentView.swift
//  CuriosUserExampleApp
//
//  Created by Eric Palma on 1/15/25.
//

import SwiftUI
import CuriousUser

struct ContentView: View {
    let sessionManager: SessionManager = SessionManager()

    var body: some View {
        NotesListView(sessionManager: sessionManager)
    }
}

#Preview {
    ContentView()
}
