//
//  TrackSelectionSheet.swift
//  Mystic Academy
//
//  Created by Anirudh Rao on 3/13/23.
//

import SwiftUI

struct TrackSelectionSheet: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedlearningTrack: String
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                VStack {
                    List(testTracks) { learningTrack in
                        Button {
                            selectedlearningTrack = learningTrack.trackName
                        } label: {
                            HStack {
                                Text(learningTrack.trackName)
                                Spacer()
                                if selectedlearningTrack == learningTrack.trackName {
                                    Image(systemName: "checkmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(.white)
                                        .padding(5)
                                        .frame(width: 20.0, height: 20.0)
                                        .background(Color.accentColor)
                                        .clipShape(Circle())
                                }
                            }
                        }
                        .listRowBackground(Color("Background"))
                    }
                    .listStyle(.plain)
                    .background(Color("Background"))
                    Button {
                        selectedlearningTrack = ""
                        dismiss()
                    } label: {
                        Text("Clear Selection")
                    }
                }
            }
            .navigationTitle("Learning Track")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "multiply")
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}

struct TrackSelectionSheet_Previews: PreviewProvider {
    static var previews: some View {
        TrackSelectionSheet(selectedlearningTrack: HomeView().$selectedlearningTrack)
    }
}
