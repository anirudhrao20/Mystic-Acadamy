//
//  TabBarView.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/12/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
            }
            .tabItem {
                Image(systemName: "square.grid.2x2")
                Text("Home")
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
