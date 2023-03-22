//
//  ContentView.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/3/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var loginManager = SessionStore()
    @AppStorage("isFirstTime") var isFirstTime: Bool = false
    
    var body: some View {
        if isFirstTime {
            OnboardingView()
                .environmentObject(loginManager)
        } else {
            TabBarView()
                .environmentObject(loginManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
