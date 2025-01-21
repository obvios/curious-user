//
//  Note.swift
//  CuriosUserExampleApp
//
//  Created by Eric Palma on 1/21/25.
//

import Foundation

struct Note: Identifiable {
    let id = UUID()
    var title: String
    var content: String
}
