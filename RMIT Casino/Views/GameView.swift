//
//  GameView.swift
//  RMIT Casino
//
//  Created by Ho Buu Quoc Phong on 04/09/2023.
//

import SwiftUI

struct GameView: View {
    
    @Binding var username: String
    
    @State private var playerScore = 0

    
    @State private var randNum1 = 1
    @State private var randNum2 = 1
    
    @State private var playerHP = 100
    @State private var cpuHP = 100
    @State private var pointGap = 0
    
    @State private var isSelected = false
    @State private var showWinMessage = false
    @State private var showLoseMessage = false
    @State private var isHPZero = false
    
    @State private var isShowingSheet = false
    
    var body: some View {
        
        // MARK: UI IMPLEMENTATION
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("green-1"), Color("yellow-1")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            

            VStack{
                
                Spacer()
                
                HStack {
                    Text("\(username)'s score: " + String(playerScore))
                        .padding(.all, 7)
                        .foregroundColor(.white).background(Capsule().fill(Color.black).opacity(0.2)).padding(.leading, 20).padding(.bottom, 20)
                    Spacer()
                    
                    
                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }.foregroundColor(.white).padding(.trailing, 20).padding(.bottom, 20)

                    
                }
                
                HStack {
                    VStack (alignment: .center){
                        (self.isHPZero == true)
                        ?
                        (self.showWinMessage == true) ? Image("you-win") : Image("you-lose")
                        : Image("")
                        Text("\(username)'s HP: " + String(playerHP))
                            .padding(.all, 7)
                            .foregroundColor(.white).background(Capsule().fill(Color.black).opacity(0.2))

                        Image("card-" + String(randNum1)).resizable().frame(width: 170, height: 240)
                        Text("Your card").foregroundColor(.white)
                    }.padding(.leading, 20)
                    Spacer()
                    VStack (alignment: .center){
                        (self.isHPZero == true)
                        ?
                        (self.showWinMessage == false) ? Image("you-win") : Image("you-lose")
                        : Image("")
                        Text("CPU's HP: " + String(cpuHP))
                            .padding(.all, 7)
                            .foregroundColor(.white).background(Capsule().fill(Color.black).opacity(0.2))
                        Image("card-" + String(randNum2)).resizable().frame(width: 170, height: 240)
                        Text("CPU's card").foregroundColor(.white)
                    }.padding(.trailing, 20)
                }
                
                Spacer()
        
                Button {
                    
                    Deal()
                    
                } label: {
                    HStack {
                        Image("dealing-icon").resizable().frame(width: 100, height: 100)
                        Text("DEAL").padding(.horizontal, 70).padding(.vertical, 15)
                            .foregroundColor(.black).background(Capsule().fill(Color.white).opacity(0.6)).padding(.leading, 20).padding(.bottom, 20).padding(.top, 20)
                    }
                }
                    
                
                HStack {
                    Image("guessing-icon").resizable().frame(width: 70, height: 100).padding(.trailing, 30).padding(.leading, 20)
                    ZStack {
                        Image("guessing-frame-icon").resizable().frame(width: 200, height: 70)
                        Button("GUESS CHANCE"){
                            self.isSelected = true
                        }.alert("TAKE A CHANCE? \n Bet next deal is a win or lose",isPresented:$isSelected){
                            Button("Win", action: {SpecialWinDeal()})
                            Button("Lose", action: {SpecialLoseDeal()})
                            Button("Cancel", role: .cancel, action: {})
                            
                        }.padding(.top, 20).foregroundColor(.black).padding(.bottom, 20)
                    }.padding(.top, 20)
                    
                }
                
                Spacer()
                
            }.blur(radius: self.isHPZero ? 5 : 0, opaque: false)
            if(self.isHPZero == true){
                ZStack{
                    Color("green-1").edgesIgnoringSafeArea(.all)
                    VStack{
                        Spacer()
                        Text("Game's over").font(.title).bold().foregroundColor(.white)
                        (self.showWinMessage == true)
                        ? Text("You won congratulations!!!").foregroundColor(.white)
                        : Text("You lost!!! Game over!").foregroundColor(.white)
                        Spacer()
                        Text("Return to main menu").foregroundColor(.white).padding(.bottom, 20)
                    }
                }.frame(width: 280, height: 400).shadow(color: Color.black,radius: 100).cornerRadius(20)
            }
        }.navigationBarTitle("Card War").sheet(isPresented: $isShowingSheet){
            SheetView()
        }
    }
    
    // MARK: GAME LOGIC
    
    
    
    // MARK: NORMAL DEALING
    func Deal(){
        
        self.randNum1 = Int.random(in: 2...13)
        self.randNum2 = Int.random(in: 2...13)
        
            if self.randNum1 > self.randNum2{
                PlayerWins()
            }
            
            if self.randNum2 > self.randNum1{
                CPUWins()
            }
    }
    
    func PlayerWins(){
        self.pointGap = self.randNum1 - self.randNum2
        self.playerScore = self.playerScore + self.pointGap
        if(self.cpuHP - self.pointGap > 0){
            self.isHPZero = false
            self.cpuHP = self.cpuHP - self.pointGap
        } else {
            self.cpuHP = 0
            self.isHPZero = true
            self.showWinMessage = true
        }
    }
    
    func CPUWins(){
        self.pointGap = self.randNum2 - self.randNum1
        if(self.playerHP - self.pointGap > 0){
            self.isHPZero = false
            self.playerHP = self.playerHP - self.pointGap
        } else {
            self.playerHP = 0
            self.isHPZero = true
            self.showWinMessage = false
        }
    }
    
    // MARK: SPECIAL DEALING
    func SpecialWinDeal(){
        self.randNum1 = Int.random(in: 2...13)
        self.randNum2 = Int.random(in: 2...13)
        
        if self.randNum1 > self.randNum2 {
            SpecialWinDealWin()
        }
        if self.randNum1 < self.randNum2 {
            SpecialWinDealLose()
        }
    }
    func SpecialLoseDeal(){
        self.randNum1 = Int.random(in: 2...13)
        self.randNum2 = Int.random(in: 2...13)
        
        if self.randNum1 > self.randNum2 {
            SpecialLoseDealLose()
            self.showWinMessage = false
        }
        if self.randNum1 < self.randNum2 {
            SpecialLoseDealWin()
            self.showWinMessage = true
        }
    }
    
    func SpecialWinDealWin(){
        self.pointGap = self.randNum1 - self.randNum2
        self.playerScore = self.playerScore + (self.pointGap * 10)
        if(self.cpuHP - (self.pointGap * 10) > 0 ){
            self.isHPZero = false
            self.cpuHP = self.cpuHP - (self.pointGap * 10)
        } else {
            self.isHPZero = true
            self.cpuHP = 0
            self.showWinMessage = true
        }
    }
    
    func SpecialWinDealLose(){
        self.pointGap = self.randNum2 - self.randNum1
        if(self.playerHP - (self.pointGap * 10) > 0){
            self.isHPZero = false
            self.playerHP = self.playerHP - (self.pointGap * 10)
        } else {
            self.isHPZero = true
            self.playerHP = 0
            self.showWinMessage = false
        }
    }
    
    func SpecialLoseDealLose(){
        self.pointGap = self.randNum1 - self.randNum2
        if(self.playerHP - (self.pointGap * 10) > 0){
            self.playerHP = self.playerHP - (self.pointGap * 10)
            self.isHPZero = false
        } else {
            self.playerHP = 0
            self.isHPZero = true
            self.showWinMessage = false
        }
    }

    
    func SpecialLoseDealWin(){
        self.pointGap = self.randNum2 - self.randNum1
        self.playerScore = self.playerScore + (self.pointGap * 10)
        if(self.cpuHP - (self.pointGap * 10) > 0 ){
            self.cpuHP = self.cpuHP - (self.pointGap * 10)
            self.isHPZero = false
        } else {
            self.cpuHP = 0
            self.isHPZero = true
            self.showWinMessage = true
        }
    }
    
}


//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView()
//    }
//}
//


