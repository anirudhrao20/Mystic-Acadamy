//
//  Category.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/13/23.
//

import SwiftUI

struct Category: Identifiable, Codable {
    let id = UUID()
    var name: String
    var icon: String
    var color: String
}

var testCategories = [
    Category(name: "Computing", icon: "laptopcomputer", color: "Tertiary-100"),
    Category(name: "Home Building", icon: "house", color: "Secondary-100")
]
