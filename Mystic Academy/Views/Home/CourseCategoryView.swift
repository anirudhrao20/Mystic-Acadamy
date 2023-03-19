//
//  CourseCategoryView.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/13/23.
//

import SwiftUI

struct CourseCategoryView: View {
    
    @Environment(\.dismiss) private var dismiss
    var category: Category
    @State var searchText = ""
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 24.0) {
                    ForEach(searchResults) { course in
                        CourseRow(course: course)
                    }
                }
            }
            .padding(.horizontal)
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
        .navigationTitle(category.name)
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
    }
    
    var searchResults: [Course] {
            if searchText.isEmpty {
                return testCourses
            } else {
                return testCourses.filter { $0.title.contains(searchText) }
            }
        }
}

struct CourseCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CourseCategoryView(category: testCategories[0])
    }
}
