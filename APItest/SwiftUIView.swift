//
//  SwiftUIView.swift
//  APItest
//
//  Created by Peter Delgado on 17/5/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import SwiftUI
import BottomSheetSwiftUI

struct SwiftUIView: View {
    @State var bottomSheetPosition: BottomSheetPosition = .bottom
        
        let backgroundColors: [Color] = [Color(red: 0.17, green: 0.17, blue: 0.33), Color(red: 0.80, green: 0.38, blue: 0.2)]
        let songs: [String] = ["One Dance (feat. Wizkid & Kyla)", "God's Plan", "SICKO MODE", "In My Feelings", "Work (feat. Drake)", "Nice For What", "Hotline Bling", "Too Good (feat. Rihanna)", "Life Is Good (feat. Drake)"]
        
        var body: some View {
            //A green gradient as a background that ignores the safe area.
            LinearGradient(gradient: Gradient(colors: self.backgroundColors), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                
                .bottomSheet(bottomSheetPosition: self.$bottomSheetPosition, options: [.animation(.linear.speed(0.4)), .dragIndicatorColor(Color(red: 0.17, green: 0.17, blue: 0.33)), .background({ AnyView(Color.black) }), .noBottomPosition, .cornerRadius(30), .shadow(color: .white)], title: "Drake") {
                    //The list of the most popular songs of the artist.
                    ScrollView {
                        ForEach(self.songs, id: \.self) { song in
                            Text(song)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading, .bottom])
                        }
                    }
                }
                .foregroundColor(.white)
        }
}



