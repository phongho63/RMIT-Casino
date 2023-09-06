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

struct LeaderboardView: View {
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color("green-1"), Color("yellow-1")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
    
            if(playersEntity.isEmpty){
                
                //Display a notify text if there is nothing to display
                VStack {
                    
                    Text("Currently there is nothing to display")
                        .foregroundColor(.white)
                    
                }
                
            } else {
                
                List(sortedEntities, id: \.username){
                    
                    //Displaying data row when there is an object to display
                    player in DataRowView(player: player)
                        .listRowBackground(Color("yellow-1"))
                    
                }
                .scrollContentBackground(.hidden)
            }
        }
        .onAppear(perform: {
            
            // Adding background music
            playSound(sound: "boba-date", type: "mp3")
            
        })
        .navigationTitle("Leaderboards").foregroundColor(.white)
    }
}

