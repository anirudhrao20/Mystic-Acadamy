//
//  CourseItem.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/13/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct CourseItem: View {
    
    @FirestoreQuery(collectionPath: "Users") var users: [User]
    var course: Course
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12.0) {
            AsyncImage(url: URL(string: course.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 256, height: 144.0)
                    .cornerRadius(16.0)
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(height: 144.0)
            }
            VStack(alignment: .leading, spacing: 4.0) {
                Text(course.title)
                    .fontWeight(.semibold)
                if users.first != nil {
                    Text("\(users.first!.firstName) \(users.first!.lastName)")
                        .fontWeight(.medium)
                        .foregroundColor(Color("Neutral-3"))
                } else {
                    Text("Instructor")
                        .fontWeight(.medium)
                        .foregroundColor(Color("Neutral-3"))
                }
                HStack(spacing: 12.0) {
                    Label {
                        Text("\(course.rating, specifier: "%.1f")")
                    } icon: {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("Secondary-100"))
                    }
                    Label {
                        Text("\(course.numberOfStudents, format: .number)")
                    } icon: {
                        Image(systemName: "person.fill")
                            .foregroundColor(Color("Secondary-100"))
                    }
                    Spacer()
                    if course.price == 0 {
                        Text("Free")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Primary-100"))
                    } else {
                        Text("\(course.discountPrice != nil ? course.discountPrice! : course.price, format: .currency(code: "USD"))")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Primary-100"))
                    }
                }
            }
        }
        .padding(16.0)
        .frame(width: 288, height: 284)
        .background(Color("Card Background"))
        .cornerRadius(24.0)
        .onAppear {
            $users.predicates.append(.isEqualTo("uid", "\(course.instructor)"))
        }
    }
}

struct CourseItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseItem(course: testCourses[0])
    }
}
