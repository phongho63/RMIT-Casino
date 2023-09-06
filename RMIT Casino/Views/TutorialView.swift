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

struct TutorialView: View {
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color("green-1"), Color("yellow-1")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                
                VStack (alignment: .leading){
                    
                    Image("card-war-banner")
                        .resizable()
                        .frame(width: 360, height: 350)
                    
                    Text("Welcome to Card Wars!")
                        .bold()
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                    
                    Text("The player and the CPU will be dealt with one card each")
                        .padding(.bottom, 20)
                        .bold()
                    
                    Text("How to win")
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 20)
                    
                    Text("If their card is higher than the CPU's, they gain points and CPU's HP will decrease depends on the point gap, deal til one of the player's HP drops to 0!")
                        .bold()
                    
                    Text("Controls")
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                        .padding(.top, 20)
                    
                    Image("dealing-icon")
                    
                    Text("Hit Deal button to start dealing both")
                        .bold()
                    
                    Image("guessing-icon")
                        .resizable()
                        .frame(width: 140, height: 200)
                        .padding(.bottom, 20)
                    
                    Text("Hit Guess button to earn higher points or lose bigger HP by guessing the outcome of the next deal")
                        .bold()
                    
                }
                .padding(.horizontal, 20)
            }
        }
        .onAppear(perform: {
            
            // Adding bgm sound
            playSound(sound: "mochi", type: "mp3")
            
        })
        .navigationTitle("Tutorial")
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
