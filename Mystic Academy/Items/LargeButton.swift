//
//  LargeButton.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/3/23.
//

import SwiftUI

struct LargeButton: View {
    
    var text = ""
    
    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(12.0)
            .background(Color("Primary-100"))
            .cornerRadius(32.0)
    }
}

struct LargeButton_Previews: PreviewProvider {
    static var previews: some View {
        LargeButton()
    }
}
