//
//  CategoryRow.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/15/23.
//

import SwiftUI

struct CategoryRow: View {
    
    var category: Category
    
    var body: some View {
        HStack(spacing: 12.0) {
            Image(systemName: category.icon)
                .foregroundColor(.white)
                .frame(width: 48.0, height: 48.0)
                .background(Color(category.color))
                .cornerRadius(8.0)
            Text(category.name)
                .fontWeight(.semibold)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.accentColor)
        }
        .padding(12.0)
        .background(Color("Card Background"))
        .cornerRadius(12.0)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(category: testCategories[0])
    }
}
