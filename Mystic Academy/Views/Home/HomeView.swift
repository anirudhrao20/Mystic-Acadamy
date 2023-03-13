//
//  HomeView.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/5/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var hasNotification = false
    var selectedlearningTrack = ""
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    
                    header
                    
                    if selectedlearningTrack.isEmpty {
                        VStack(spacing: 24.0) {
                            trackSelector
                            
                            categorySelector
                            
                            recommendedList
                            
                            popularList
                        }
                    } else {
                        VStack(spacing: 24.0) {
                            trackSelector
                            
                            trackBody
                        }
                    }
                }
                .padding(.horizontal, 24.0)
            }
        }
    }
    
    var header: some View {
        HStack(spacing: 8.0) {
            Circle()
                .frame(width: 48, height: 48)
            VStack(alignment: .leading) {
                Text("Welcome Back!")
                    .font(.callout)
                    .fontWeight(.medium)
                Text("Anirudh Rao")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            Spacer()
            if hasNotification {
                Image(systemName: "bell.badge.fill")
                    .symbolRenderingMode(.multicolor)
                    .foregroundStyle(Color.red)
                    .font(.title2)
                    .padding(8.0)
                    .background(Color("Card Background"))
                    .cornerRadius(8.0)
            } else {
                Image(systemName: "bell.fill")
                    .font(.title2)
                    .padding(8.0)
                    .background(Color("Card Background"))
                    .cornerRadius(8.0)
            }
        }
    }
    
    var trackSelector: some View {
        ZStack {
            Image("Banner")
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                Text(selectedlearningTrack.isEmpty ? "Choose a Learning Track" : selectedlearningTrack)
                Spacer()
                Image(systemName: "chevron.down")
            }
            
            //        Picker(selection: .constant(1)) {
            //            Text("Choose a Learning Track")
            //        } label: {
            //            Text("Track")
            //        }
            //        .frame(maxWidth: .infinity)
            .fontWeight(.semibold)
            .foregroundColor(Color("Neutral-3"))
            .padding(.vertical, 12)
            .padding(.horizontal, 24)
            .background(Color("Card Background"))
            .cornerRadius(100)
            .padding(.horizontal, 16)
            .offset(y: 50)
        }
    }
    
    var categorySelector: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            HStack {
                Text("Categories")
                    .fontWeight(.bold)
                Spacer()
                Button {
                    
                } label: {
                    Text("See all")
                        .fontWeight(.bold)
                }
                
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12.0) {
                    ForEach(testCategories) { category in
                        CategoryItem(category: category)
                    }
                }
            }
        }
    }
    
    var recommendedList: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            HStack {
                Text("Recommended Courses")
                    .fontWeight(.bold)
                Spacer()
                Button {
                    
                } label: {
                    Text("See all")
                        .fontWeight(.bold)
                }
                
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12.0) {
                    ForEach(testCourses.prefix(5)) { course in
                        CourseItem(course: course)
                    }
                }
            }
        }
    }
    
    var popularList: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            HStack {
                Text("Popular Courses")
                    .fontWeight(.bold)
                Spacer()
                Button {
                    
                } label: {
                    Text("See all")
                        .fontWeight(.bold)
                }
                
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12.0) {
                    ForEach(sortPopularCourses().prefix(5)) { course in
                        CourseItem(course: course)
                    }
                }
            }
        }
    }
    
    var trackBody: some View {
        VStack(alignment: .leading, spacing: 32.0) {
            VStack(alignment: .leading, spacing: 16.0) {
                Text("Foundation")
                    .fontWeight(.bold)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12.0) {
                        ForEach(sortPopularCourses()) { course in
                            CourseItem(course: course)
                        }
                    }
                }
            }
            VStack(alignment: .leading, spacing: 16.0) {
                Text("Beginner")
                    .fontWeight(.bold)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12.0) {
                        ForEach(sortPopularCourses()) { course in
                            CourseItem(course: course)
                        }
                    }
                }
            }
            VStack(alignment: .leading, spacing: 16.0) {
                Text("Intermediate")
                    .fontWeight(.bold)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12.0) {
                        ForEach(sortPopularCourses()) { course in
                            CourseItem(course: course)
                        }
                    }
                }
            }
            VStack(alignment: .leading, spacing: 16.0) {
                Text("Advanced")
                    .fontWeight(.bold)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12.0) {
                        ForEach(sortPopularCourses()) { course in
                            CourseItem(course: course)
                        }
                    }
                }
            }
        }
    }
    
    func sortPopularCourses() -> [Course] {
        return testCourses.sorted(by: { $0.numberOfStudents > $1.numberOfStudents })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
