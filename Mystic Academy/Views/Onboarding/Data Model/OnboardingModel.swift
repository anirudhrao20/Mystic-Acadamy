//
//  OnboardingModel.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/3/23.
//

import SwiftUI

struct OnboardingModel: Identifiable {
    let id = UUID()
    var title: String
    var body: String
    var image: String
}

var onboardingScreens = [
    OnboardingModel(title: "Greetings, Mystifiers!", body: "Welcome to Mystic Academy!\nThe best community to master all the mysteries of being an adult!", image: "Onboarding 1"),
    OnboardingModel(title: "Meet Our Expert Instructors!", body: "Let's explore courses with our expert and professional instructors. Interactive learning and you can give us feedback.", image: "Onboarding 2"),
    OnboardingModel(title: "Learn Anytime, Anywhere!", body: "Master all the topics to help through becoming an adult, from the comfort of your own device!", image: "Onboarding 3")
]
