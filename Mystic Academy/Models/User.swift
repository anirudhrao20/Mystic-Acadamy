//
//  User.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/20/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct User: Identifiable, Codable, Equatable {
    @DocumentID var id: String?
    var firstName: String
    var lastName: String
    var role: String
    var uid: String
    var coursesTaught: [String]?
    var coursesEnrolledIn: [String]?
    var about: String?
}
