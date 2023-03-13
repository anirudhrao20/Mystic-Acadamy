//
//  CourseItem.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/13/23.
//

import SwiftUI

struct CourseItem: View {
    
    var course: Course
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12.0) {
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 144.0)
            VStack(alignment: .leading, spacing: 4.0) {
                Text(course.title)
                    .fontWeight(.semibold)
                Text(course.instructor)
                    .fontWeight(.medium)
                    .foregroundColor(Color("Neutral-3"))
                HStack(spacing: 12.0) {
                    Label("\(course.rating, specifier: "%.1f")", systemImage: "star.fill")
                    Label("\(course.numberOfStudents, format: .number)", systemImage: "person.fill")
                    Spacer()
                    Text("\(course.price, format: .currency(code: "USD"))")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Primary-100"))
                }
            }
        }
        .padding(16.0)
        .frame(width: 288, height: 284)
        .background(Color("Card Background"))
        .cornerRadius(24.0)
    }
}

struct CourseItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseItem(course: testCourses[0])
    }
}
