//
//  SessionStore.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/20/23.
//

import Foundation
import SwiftUI
import Combine
import FirebaseAuth

class SessionStore : ObservableObject {
    
    @Published var isLoggedIn = false
    
    var didChange = PassthroughSubject<SessionStore, Never>()
    var session: FirebaseUser? { didSet { self.didChange.send(self) }}
    var handle: AuthStateDidChangeListenerHandle?
    
    func listen () {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    withAnimation {
                        self.isLoggedIn = true
                    }
                }
                print("Got user: \(user)")
                self.session = FirebaseUser(
                    uid: user.uid,
                    displayName: user.displayName ?? "",
                    email: user.email ?? ""
                )
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    withAnimation {
                        self.isLoggedIn = false
                    }
                }
                self.session = nil
            }
        }
    }
    
    func createUserEmailPass(
        email: String,
        password: String
    ) {
        Auth.auth().createUser(withEmail: email, password: password)
    }
    
    func loginWithEmailPass(
        email: String,
        password: String
    ) {
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func signOut () -> Bool {
        do {
            try Auth.auth().signOut()
            self.session = nil
            self.isLoggedIn = false
            return true
        } catch {
            return false
        }
    }
    func unbind () {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
}
