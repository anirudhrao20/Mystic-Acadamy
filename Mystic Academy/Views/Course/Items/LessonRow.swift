//
//  LessonItem.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/20/23.
//

import SwiftUI

struct LessonRow: View {
    
    var lesson: Lesson
    @State var isLocked = false
    @State var completed = false
    
    var body: some View {
        HStack(spacing: 12.0) {
            Image("CourseImage")
                .resizable()
                .frame(width: 60.0, height: 60.0)
            VStack(alignment: .leading, spacing: 4.0) {
                Text(lesson.title)
                    .fontWeight(.medium)
                Text("Lesson \(lesson.index, format: .number)")
                    .foregroundColor(Color("Neutral-3"))
            }
            Spacer()
            if lesson.isLocked {
                Image(systemName: "lock.fill")
                    .foregroundColor(Color("Neutral-2"))
                    .frame(width: 40.0, height: 40.0)
                    .background(Color("Card Background"))
                    .clipShape(Circle())
                    .padding(8.0)
                    .background(Color("Neutral-2"))
                    .frame(width: 48.0, height: 48.0)
                    .clipShape(Circle())
            } else {
                if lesson.completed {
                    Image(systemName: "checkmark")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Success"))
                        .frame(width: 40.0, height: 40.0)
                        .background(Color("Card Background"))
                        .clipShape(Circle())
                        .padding(8.0)
                        .background(Color("Success"))
                        .frame(width: 48.0, height: 48.0)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "lock.open").foregroundColor(Color("Neutral-2"))
                        .frame(width: 40.0, height: 40.0)
                        .background(Color("Card Background"))
                        .clipShape(Circle())
                        .padding(8.0)
                        .background(Color("Neutral-2"))
                        .frame(width: 48.0, height: 48.0)
                        .clipShape(Circle())
                }
            }
        }
        .padding(12.0)
        .background(Color("Background"))
        .cornerRadius(16.0)
    }
}

struct LessonItem_Previews: PreviewProvider {
    static var previews: some View {
        LessonRow(lesson: Lesson(image: "", title: "Test", transcript: "Test Transcript", isLocked: true, completed: false, uid: "VLOegGU6bxoyO0P4G00b", index: 1))
    }
}
