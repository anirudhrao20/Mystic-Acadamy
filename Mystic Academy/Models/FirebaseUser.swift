//
//  FirebaseUser.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/20/23.
//

import SwiftUI

struct FirebaseUser: Identifiable, Codable {
    let id = UUID()
    let uid: String
    let displayName: String
    let email: String
}
