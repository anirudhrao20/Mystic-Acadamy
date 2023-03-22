//
//  Course.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/13/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Course: Identifiable, Codable, Equatable {
    @DocumentID var id: String?
    var image: String
    var title: String
    var instructor: String
    var category: String
    var rating: Double
    var numberOfStudents: Double
    var price: Double
    var discountPrice: Double?
    var summary: String
    var difficulty: String
    var language: String
    var requiredTools: [String]?
    var reviews: [String]?
    var uid: String
}

var testCourses = [
    Course(image: "https://firebasestorage.googleapis.com/v0/b/mystic-academy-20355.appspot.com/o/whatiscreditcourseimage.png?alt=media&token=def6f43b-b058-45d6-a746-e369a50a06c0", title: "Sketching: Transform your doodles into art", instructor: "Anirudh Rao", category: "Computing", rating: 5.0, numberOfStudents: 14000, price: 3.0, discountPrice: 2.5, summary: "Learn the fundamentals of children’s book illustration to create a playful portfolio ready to share with editors and art directors...", difficulty: "Beginner", language: "English", requiredTools: ["Excel"], uid: "T7qqYKTUF6ItRi1UXYWE"),
    Course(image: "CourseImage", title: "Illustration Techniques to Unlock your Creativity", instructor: "Manas Karingal", category: "Computing", rating: 4.9, numberOfStudents: 1275034, price: 7, discountPrice: 5.0, summary: "Learn the fundamentals of children’s book illustration to create a playful portfolio ready to share with editors and art directors...", difficulty: "Beginner", language: "English", requiredTools: ["Excel", "Outlook"], uid: "T7qqYKTUF6ItRi1UXYWE"),
    Course(image: "CourseImage", title: "Fill Your Illustrations with Life and Detail", instructor: "Aashish Kapoor", category: "House Building", rating: 4.9, numberOfStudents: 198263, price: 99, summary: "Learn the fundamentals of children’s book illustration to create a playful portfolio ready to share with editors and art directors...", difficulty: "Beginner", language: "English", requiredTools: ["Excel", "Outlook", "Amex Account"], reviews: ["Yes that one"], uid: "T7qqYKTUF6ItRi1UXYWE")
]
