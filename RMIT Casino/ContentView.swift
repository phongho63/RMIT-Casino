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
                    
                    Image("card-war-banner").resizable().frame(width: 380, height: 380)
                    
                    Text("Card War").font(.title).bold().foregroundColor(.white)
                    
                    Spacer()
                    
                    NavigationLink("PLAY") {
                        PlayerRegisterView()
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
