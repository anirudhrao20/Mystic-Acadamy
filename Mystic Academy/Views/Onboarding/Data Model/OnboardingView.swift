//
//  OnboardingView.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/3/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var loginManager: SessionStore
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack(spacing: 16.0) {
                TabView {
                    ForEach(onboardingScreens) { onboaringScreen in
                        VStack(spacing: 16.0) {
                            Image(onboaringScreen.image)
                            Text(onboaringScreen.title)
                                .font(.title)
                                .fontWeight(.bold)
                            Text(onboaringScreen.body)
                        }
                        .multilineTextAlignment(.center)
                    }
                }
                .tabViewStyle(.page)
                Button {
                    
                } label: {
                    LargeButton(text: "Continue")
                }
                Button {
                    
                } label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 24.0)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .environmentObject(SessionStore())
    }
}
