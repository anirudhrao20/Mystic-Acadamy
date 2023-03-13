//
//  CategoryItem.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/12/23.
//

import SwiftUI

struct CategoryItem: View {
    
    var category: Category
    
    var body: some View {
        VStack {
            Image(systemName: category.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .padding(10.0)
                .frame(width: 48, height: 48)
                .background(Color(category.color))
                .cornerRadius(16.0)
            Text(category.name)
        }
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(category: testCategories[0])
    }
}
