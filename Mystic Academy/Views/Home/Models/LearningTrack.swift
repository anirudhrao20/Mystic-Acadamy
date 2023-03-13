//
//  LearningTrack.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/13/23.
//

import SwiftUI

struct LearningTrack: Identifiable, Codable {
    let id = UUID()
    var trackName: String
}

var testTracks = [
    LearningTrack(trackName: "Credit 101"),
    LearningTrack(trackName: "Taxes 101"),
    LearningTrack(trackName: "Banking 101"),
]
