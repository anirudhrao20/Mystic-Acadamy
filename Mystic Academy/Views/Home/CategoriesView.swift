//
//  CategoriesView.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/13/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct CategoriesView: View {
    
    @Environment(\.dismiss) private var dismiss
    @FirestoreQuery(collectionPath: "Categories") var categories: [Category]
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 24.0) {
                    ForEach(categories) { category in
                        NavigationLink {
                            CourseCategoryView(category: category)
                        } label: {
                            CategoryRow(category: category)
                        }
                    }
                }
            }
            .padding(24.0)
        }
        .navigationTitle("Categories")
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
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
