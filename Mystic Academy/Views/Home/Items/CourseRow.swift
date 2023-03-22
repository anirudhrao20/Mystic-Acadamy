//
//  CourseRow.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/15/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct CourseRow: View {
    
    @FirestoreQuery(collectionPath: "Users") var users: [User]
    var course: Course
    
    var body: some View {
        HStack(spacing: 12.0) {
            AsyncImage(url: URL(string: course.image)) { image in
                image
                    .resizable()
                    .frame(width: 96.0, height: 88.0)
                    .cornerRadius(12.0)
            } placeholder: {
                ProgressView()
                    .frame(width: 96, height: 88)
            }
            VStack(alignment: .leading, spacing: 4.0) {
                Text(course.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                if users.first != nil {
                    Text("\(users.first!.firstName) \(users.first!.lastName)")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(Color("Neutral-3"))
                } else {
                    Text("-")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(Color("Neutral-3"))
                }
                HStack(spacing: 12.0) {
                    Label("\(course.rating, specifier: "%.1f")", systemImage: "star.fill")
                        .font(.caption)
                    Label("\(course.numberOfStudents, format: .number)", systemImage: "person.fill")
                        .font(.caption)
                    Spacer()
                    if course.discountPrice != nil {
                        if course.discountPrice == 0 {
                            VStack(alignment: .trailing) {
                                Text("Free")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Primary-100"))
                                Text(course.price, format: .currency(code: "USD"))
                                    .font(.caption)
                                    .foregroundColor(Color("Neutral-3"))
                                    .strikethrough()
                            }
                        } else {
                            VStack(alignment: .trailing) {
                                Text(course.discountPrice!, format: .currency(code: "USD"))
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Primary-100"))
                                Text(course.price, format: .currency(code: "USD"))
                                    .font(.caption)
                                    .foregroundColor(Color("Neutral-3"))
                                    .strikethrough()
                            }
                        }
                    } else {
                        Text(course.price, format: .currency(code: "USD"))
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(Color("Primary-100"))
                    }
                }
            }
        }
        .padding(16.0)
        .background(Color("Card Background"))
        .cornerRadius(24.0)
        .onAppear {
            $users.predicates.append(.isEqualTo("uid", "\(course.instructor)"))
        }
    }
}

struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        CourseRow(course: testCourses[0])
    }
}
