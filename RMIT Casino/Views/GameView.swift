//
//  GameView.swift
//  RMIT Casino
//
//  Created by Ho Buu Quoc Phong on 04/09/2023.
//

import SwiftUI

struct GameView: View {
    
    @State private var randNum1 = 1
    @State private var randNum2 = 1
    
    @State private var playerScore = 0
    @State private var CPUScore = 0
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("green-1"), Color("yellow-1")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack{
                
                Spacer()
                HStack{
                    Text("Player's score: " + String(playerScore))
                        .padding(.all, 7)
                        .foregroundColor(.white).background(Capsule().fill(Color.black).opacity(0.2))
                    Spacer()
                    Text("CPU's score: " + String(CPUScore))
                        .padding(.all, 7)
                        .foregroundColor(.white).background(Capsule().fill(Color.black).opacity(0.2))
                    
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
                Spacer()
                
                HStack {
                    VStack (alignment: .center){
                        Image("card-" + String(randNum1)).resizable().frame(width: 170, height: 240)
                        Text("Your card")
                    }.padding(.leading, 20)
                    Spacer()
                    VStack (alignment: .center){
                        Image("card-" + String(randNum2)).resizable().frame(width: 170, height: 240)
                        Text("CPU's card")
                    }.padding(.trailing, 20)
                }
                
                Spacer()
                Button {
                    self.randNum1 = Int.random(in: 2...13)
                    self.randNum2 = Int.random(in: 2...13)
                    
                    if self.randNum1 > self.randNum2 {
                        self.playerScore += 10
                    }
                    
                    if self.randNum2 > self.randNum1 {
                        self.CPUScore += 10
                    }
                } label: {
                    Text("DEAL").foregroundColor(.black)
                }

                Spacer()
            }
            
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
