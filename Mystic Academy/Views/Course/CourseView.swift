//
//  CourseView.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/20/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct CourseView: View {
    
    @Environment(\.dismiss) private var dismiss
    @FirestoreQuery(collectionPath: "Users") var users: [User]
    @FirestoreQuery(collectionPath: "Courses") var units: [Unit]
    var course: Course
    @State var selection = "Content"
    @State var isBookmarked = false
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 24.0) {
                    
                    AsyncImage(url: URL(string: course.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(12.0)
                    } placeholder: {
                        ProgressView()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .frame(height: 150)
                    }
                    
                    courseInfo
                    
                    Picker(selection: $selection, label: Text("Information Picker")) {
                        Text("About").tag("About")
                        Text("Content").tag("Content")
                        Text("Reviews").tag("Reviews")
                    }
                    .pickerStyle(.segmented)
                    
                    if selection == "About" {
                        aboutCourse
                    } else if selection == "Content" {
                        courseContent
                    } else if selection == "Reviews" {
                        courseReviews
                    }
                    
                    bottomBar
                }
                .padding(.horizontal, 24.0)
            }
        }
        .navigationTitle(course.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
                
            }
        }
        .onAppear {
            $users.predicates.append(.isEqualTo("uid", "\(course.instructor)"))
            $units.path = "Courses/\(course.uid)/Units"
            $units.predicates.append(.orderBy("desc", true))
        }
    }
    
    var courseInfo: some View {
        VStack(alignment: .leading, spacing: 12.0) {
            Text(course.title)
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack(spacing: 9.0) {
                AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/mystic-academy-20355.appspot.com/o/\(course.instructor).jpg?alt=media&token=db8e4a1b-aafe-4087-bb26-fabb920381b8")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40.0, height: 40.0)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
                VStack(alignment: .leading) {
                    if users.first != nil {
                        Text("\(users.first!.firstName) \(users.first!.lastName)")
                            .fontWeight(.medium)
                    } else {
                        Text("-")
                            .fontWeight(.medium)
                    }
                    Text("Instructor")
                        .foregroundColor(Color("Neutral-3"))
                }
                Spacer()
                if course.discountPrice != nil {
                    if course.discountPrice == 0 {
                        VStack(alignment: .trailing) {
                            Text("Free")
                                .fontWeight(.bold)
                                .foregroundColor(Color("Primary-100"))
                            Text(course.price, format: .currency(code: "USD"))
                                .font(.callout)
                                .foregroundColor(Color("Neutral-3"))
                                .strikethrough()
                        }
                    } else {
                        VStack(alignment: .trailing) {
                            Text(course.discountPrice!, format: .currency(code: "USD"))
                                .fontWeight(.bold)
                                .foregroundColor(Color("Primary-100"))
                            Text(course.price, format: .currency(code: "USD"))
                                .font(.callout)
                                .foregroundColor(Color("Neutral-3"))
                                .strikethrough()
                        }
                    }
                } else {
                    if course.price == 0 {
                        Text("Free")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Primary-100"))
                    } else {
                        Text(course.price, format: .currency(code: "USD"))
                            .fontWeight(.bold)
                            .foregroundColor(Color("Primary-100"))
                    }
                }
            }
            HStack(spacing: 12.0) {
                HStack(spacing: 4.0) {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color("Secondary-100"))
                    Text(course.rating, format: .number)
                }
                HStack(spacing: 4.0) {
                    Image(systemName: "play.circle.fill")
                        .foregroundColor(Color("Secondary-100"))
                    Text("\(12, format: .number) Lessons")
                }
                HStack(spacing: 4.0) {
                    Image(systemName: "person.2.fill")
                        .foregroundColor(Color("Secondary-100"))
                    Text("\(course.numberOfStudents, format: .number) Students")
                }
            }
            .font(.footnote)
        }
    }
    
    var aboutCourse: some View {
        VStack(alignment: .leading, spacing: 24.0) {
            VStack(alignment: .leading, spacing: 8.0) {
                Text("Course Summary")
                    .fontWeight(.semibold)
                Text(course.summary)
            }
            VStack(alignment: .leading, spacing: 8.0) {
                Text("Details")
                    .fontWeight(.semibold)
                HStack(spacing: 32.0) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Label {
                            Text(course.difficulty)
                        } icon: {
                            Image(systemName: "text.book.closed.fill")
                                .foregroundColor(Color("Secondary-100"))
                        }
                        Label {
                            Text(course.language)
                        } icon: {
                            Image(systemName: "mic.fill")
                                .foregroundColor(Color("Secondary-100"))
                        }
                    }
                    VStack(alignment: .leading, spacing: 8.0) {
                        Label {
                            Text("\(12, format: .number) Lessons")
                        } icon: {
                            Image(systemName: "play.circle.fill")
                                .foregroundColor(Color("Secondary-100"))
                        }
                        Label {
                            Text("\(12, format: .number) Resources")
                        } icon: {
                            Image(systemName: "doc.text.fill")
                                .foregroundColor(Color("Secondary-100"))
                        }
                    }
                }
                .fontWeight(.semibold)
            }
            VStack(alignment: .leading, spacing: 8.0) {
                Text("About Instructor")
                    .fontWeight(.semibold)
                Text(users.first?.about ?? "-")
            }
            if course.requiredTools != nil {
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("Required Tools")
                        .fontWeight(.semibold)
                    ForEach(course.requiredTools!, id: \.self) { requiredTool in
                        HStack(spacing: 8.0) {
                            Circle()
                                .frame(width: 32.0, height: 32.0)
                            Text(requiredTool)
                        }
                    }
                }
            }
        }
    }
    
    var courseContent: some View {
        VStack(alignment: .leading, spacing: 24.0) {
            ForEach(units) { unit in
                CourseUnit(courseUID: course.uid, unit: unit)
            }
        }
    }
    
    var courseReviews: some View {
        VStack {
            if course.reviews != nil {
                ForEach(course.reviews!, id: \.self) { review in
                    ReviewItem(review: review)
                }
            } else {
                Text("No Reviews")
            }
        }
    }
    
    var bottomBar: some View {
        HStack(spacing: 12.0) {
            Button {
                isBookmarked.toggle()
            } label: {
                if isBookmarked {
                    Image(systemName: "bookmark.fill")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(12.0)
                        .frame(maxWidth: .infinity)
                        .frame(width: 48.0, height: 48.0)
                        .background(Color("Primary-100"))
                        .cornerRadius(16.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16.0)
                                .stroke(Color("Primary-100"), lineWidth: 2)
                        )
                } else {
                    Image(systemName: "bookmark")
                        .fontWeight(.semibold)
                        .padding(12.0)
                        .frame(maxWidth: .infinity)
                        .frame(width: 48.0, height: 48.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16.0)
                                .stroke(Color("Primary-100"), lineWidth: 2)
                        )
                }
            }
            .buttonStyle(.plain)
            Button {
                selection = "Content"
            } label: {
                Text("Start Learning")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding(12.0)
                    .frame(maxWidth: .infinity)
                    .background(Color("Primary-100"))
                    .cornerRadius(32.0)
            }
            .buttonStyle(.plain)
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView(course: Course(image: "https://firebasestorage.googleapis.com/v0/b/mystic-academy-20355.appspot.com/o/whatiscreditcourseimage.png?alt=media&token=def6f43b-b058-45d6-a746-e369a50a06c0", title: "Credit Fundamentals", instructor: "ipY9ZWnF1x5ZWxd0cBN7", category: "Credit", rating: 0, numberOfStudents: 0, price: 0, summary: "Test", difficulty: "Beginner", language: "English", uid: "T7qqYKTUF6ItRi1UXYWE"))
    }
}
