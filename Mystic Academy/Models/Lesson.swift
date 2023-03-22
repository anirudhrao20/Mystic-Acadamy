//
//  Lesson.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/20/23.
//

import SwiftUI

struct Lesson: Identifiable, Codable {
    let id = UUID()
    var image: String
    var title: String
    var transcript: String
    var isLocked: Bool
    var completed: Bool
    var uid: String
    var index: Double
}

var testLessons = [
    Lesson(image: "CourseImage", title: "Test Lesson 1", transcript: "Test", isLocked: false, completed: false, uid: "VLOegGU6bxoyO0P4G00b", index: 9999)
]
