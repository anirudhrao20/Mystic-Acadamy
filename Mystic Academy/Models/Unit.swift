//
//  Unit.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/20/23.
//

import SwiftUI

struct Unit: Identifiable, Codable {
    let id = UUID()
    var title: String
    var uid: String
    var order: Double
}
