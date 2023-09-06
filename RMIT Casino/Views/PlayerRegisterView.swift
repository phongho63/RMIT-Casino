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

struct PlayerRegisterView: View {
    
    @State private var username: String = ""
    @State private var isGameViewActive = false
    @StateObject var globalString = GlobalString()
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("green-1"), Color("yellow-1")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                

                
              
                    ZStack{
                        Color("yellow-2")
                    }.frame(height: 140)
                    VStack(alignment: .center){
                        Text("Please enter your player name: ")
                        
                        TextField("Username", text: $username).textFieldStyle(.roundedBorder).padding(.horizontal, 20)
                        
                        
                        NavigationLink("Enter") {
                            GameView(username: $username, difficulty: $globalString.difficulty)
                        }.padding(.bottom, 20).foregroundColor(.black).padding(.top, 10)
                        
                    }.padding(.top, 20)
                

            }
        }
    }
}

struct PlayerRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRegisterView()
    }
}
