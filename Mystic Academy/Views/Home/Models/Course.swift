//
//  Course.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/13/23.
//

import SwiftUI

struct Course: Identifiable, Codable {
    let id = UUID()
    var image: String
    var title: String
    var instructor: String
    var category: String
    var rating: Double
    var numberOfStudents: Double
    var price: Double
}

var testCourses = [
    Course(image: "CourseImage", title: "Sketching: Transform your doodles into art", instructor: "Anirudh Rao", category: "Test", rating: 5.0, numberOfStudents: 14000, price: 3.0),
    Course(image: "CourseImage", title: "Illustration Techniques to Unlock your Creativity", instructor: "Manas Karingal", category: "Test", rating: 4.9, numberOfStudents: 12034, price: 5),
    Course(image: "CourseImage", title: "Fill Your Illustrations with Life and Detail", instructor: "Aashish Kapoor", category: "Test", rating: 4.9, numberOfStudents: 198263, price: 99)
]
