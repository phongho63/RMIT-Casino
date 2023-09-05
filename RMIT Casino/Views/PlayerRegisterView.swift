//
//  PlayerRegisterView.swift
//  RMIT Casino
//
//  Created by Ho Buu Quoc Phong on 05/09/2023.
//

import SwiftUI

struct PlayerRegisterView: View {
    
    @State private var username: String = ""
    @State private var isGameViewActive = false
    
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
                            GameView(username: $username)
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
