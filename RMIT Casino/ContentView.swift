//
//  ContentView.swift
//  RMIT Casino
//
//  Created by Ho Buu Quoc Phong on 11/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("green-1"), Color("yellow-1")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Card War").padding(.top, 100)
                    
                    Spacer()

                    NavigationLink("PLAY") {
                        GameView()
                    }.padding(.bottom, 20).foregroundColor(.black)
                
                    NavigationLink("LEADERBOARD") {
                        LeaderboardView()
                    }.padding(.bottom, 20).foregroundColor(.black)
                    
                    NavigationLink("HOW TO PLAY") {
                        TutorialView()
                    }.padding(.bottom, 20).foregroundColor(.black)
                    
                    NavigationLink("SETTINGS") {
                        SettingView()
                    }.padding(.bottom, 20).foregroundColor(.black)
                }
                .padding(.bottom, 70)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
