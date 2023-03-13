//
//  ContentView.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/3/23.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isFirstTime") var isFirstTime: Bool = false
    
    var body: some View {
        if isFirstTime {
            OnboardingView()
        } else {
            TabBarView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
