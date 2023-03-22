//
//  ReviewItem.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/20/23.
//

import SwiftUI

struct ReviewItem: View {
    
    var review: String
    
    var body: some View {
        HStack(alignment: .top) {
            Circle()
                .frame(width: 48.0, height: 48.0)
            VStack(alignment: .leading) {
                Text("Anirudh Rao")
                    .fontWeight(.semibold)
                Text(Date().formatted(date: .abbreviated, time: .omitted))
                    .font(.subheadline)
                    .foregroundColor(Color("Neutral-4"))
                Text(review)
            }
            Spacer()
            Label {
                Text(5, format: .number)
            } icon: {
                Image(systemName: "star.fill")
            }
            .foregroundColor(Color("Info"))
            .padding(8.0)
            .background(Color("Tertiary-80"))
            .cornerRadius(10.0)
        }
        .padding(12.0)
        .background(Color("Card Background"))
        .cornerRadius(16.0)
    }
}

struct ReviewItem_Previews: PreviewProvider {
    static var previews: some View {
        ReviewItem(review: "Test")
    }
}
