/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Ho Buu Quoc Phong
  ID: s3803566
  Created  date: 11/08/2023
  Last modified: 06/09/2023
  Acknowledgement: Stackoverflow, chatGPT, Youtube, Lecture slides.
*/

import SwiftUI

struct ContentView: View {
    
    @StateObject var globalString = GlobalString()

    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color("green-1"), Color("yellow-1")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    Image("card-war-banner").resizable().frame(width: 380, height: 380)
                    
                    Text("Card War").font(.title).bold().foregroundColor(.white)
                    
                    Spacer()
                    
                    // MARK: MAIN FEATURE VIEWS
                    
                    // Adding a difficulty display outside
                    NavigationLink("PLAY    (Difficulty: \(globalString.difficulty))") {
                        PlayerRegisterView()
                    }
                    .padding(.bottom, 20)
                    .foregroundColor(.black)
                        
                    NavigationLink("LEADERBOARD") {
                        LeaderboardView()
                    }
                    .padding(.bottom, 20)
                    .foregroundColor(.black)
                    
                    NavigationLink("HOW TO PLAY") {
                        TutorialView()
                    }
                    .padding(.bottom, 20)
                    .foregroundColor(.black)
                    
                    NavigationLink("SETTINGS") {
                        SettingView()
                    }
                    .padding(.bottom, 20)
                    .foregroundColor(.black)
                }
                .padding(.bottom, 70)
            }
        }
        .onAppear(
            // Background music implementations
            perform: {
                playSound(sound: "sharou", type: "mp3")
            }
            
        )
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
