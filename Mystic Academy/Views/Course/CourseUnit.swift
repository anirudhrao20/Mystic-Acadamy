//
//  CourseUnit.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/20/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct CourseUnit: View {
    
    @FirestoreQuery(collectionPath: "Courses") var lessons: [Lesson]
    var courseUID: String
    var unit: Unit
    @State var isExpanded = true
    @State var sortedLessons = [Lesson]()
    
    var body: some View {
        Group {
            if isExpanded {
                VStack(alignment: .leading, spacing: 16.0) {
                    HStack {
                        Text(unit.title)
                        Spacer()
                        Button {
                            isExpanded.toggle()
                        } label: {
                            Image(systemName: "chevron.up")
                                .foregroundColor(.accentColor)
                        }
                    }
                    .fontWeight(.semibold)
                    ForEach(lessons) { lesson in
                        LessonRow(lesson: lesson)
                    }
                }
                .padding(16.0)
                .background(Color("Card Background"))
                .cornerRadius(16.0)
            } else {
                Button {
                    isExpanded.toggle()
                } label: {
                    VStack(alignment: .leading, spacing: 16.0) {
                        HStack {
                            Text(unit.title)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.accentColor)
                        }
                        .fontWeight(.semibold)
                    }
                    .padding(16.0)
                    .background(Color("Card Background"))
                    .cornerRadius(16.0)
                }
                .buttonStyle(.plain)
            }
        }
        .onAppear {
            $lessons.path = "Courses/\(courseUID)/Units/\(unit.uid)/Lessons"
        }
    }
}

struct CourseUnit_Previews: PreviewProvider {
    static var previews: some View {
        CourseUnit(courseUID: "T7qqYKTUF6ItRi1UXYWE", unit: Unit(title: "Diving Deeper into Credit", uid: "iBUUlXmczD4WwYuq12GB", order: 1))
    }
}
