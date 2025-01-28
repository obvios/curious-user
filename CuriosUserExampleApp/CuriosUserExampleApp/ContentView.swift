//
//  ContentView.swift
//  CuriosUserExampleApp
//
//  Created by Eric Palma on 1/15/25.
//

import SwiftUI
import CuriousUser

struct ContentView: View {
    @EnvironmentObject var sessionManager: SessionManager

    var body: some View {
        NotesListView(sessionManager: sessionManager)
    }
}
