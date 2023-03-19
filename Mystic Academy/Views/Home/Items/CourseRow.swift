//
//  CourseRow.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/15/23.
//

import SwiftUI

struct CourseRow: View {
    
    var course: Course
    
    var body: some View {
        HStack(spacing: 12.0) {
            Image(course.image)
                .resizable()
                .frame(width: 96.0, height: 88.0)
            VStack(alignment: .leading, spacing: 4.0) {
                Text(course.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                Text(course.instructor)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(Color("Neutral-3"))
                HStack(spacing: 12.0) {
                    Label("\(course.rating, specifier: "%.1f")", systemImage: "star.fill")
                        .font(.caption)
                    Label("\(course.numberOfStudents, format: .number)", systemImage: "person.fill")
                        .font(.caption)
                    Spacer()
                    Text("\(course.price, format: .currency(code: "USD"))")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Primary-100"))
                }
            }
        }
        .padding(16.0)
        .background(Color("Card Background"))
        .cornerRadius(24.0)
    }
}

struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        CourseRow(course: testCourses[0])
    }
}
