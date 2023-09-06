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

struct GameView: View {
    
    @Binding var username: String
    
    @Binding var difficulty: String
    
    @State private var playerScore = 0

    
    @State private var randNum1 = 1
    @State private var randNum2 = 1
    
    @State private var playerHP = 100
    @State private var cpuHP = 100
    @State private var pointGap = 0
    @State private var counter = 0
    @State private var isWin = false
    
    @State private var isSelected = false
    @State private var showWinMessage = false
    @State private var showLoseMessage = false
    @State private var isHPZero = false
    
    @State private var isShowingSheet = false
    @State private var animateCard = false
    
    @StateObject var globalString = GlobalString()
    
    var body: some View {
        
        // MARK: UI IMPLEMENTATION
        NavigationStack{
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

                            Image("card-" + String(randNum1)).resizable().frame(width: 170, height: 240).offset(y: animateCard ? 0 : -30)
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
                            Image("card-" + String(randNum2)).resizable().frame(width: 170, height: 240).offset(y: animateCard ? 0 : -30)
                            Text("CPU's card").foregroundColor(.white)
                        }.padding(.trailing, 20)
                    }
                    
                    Spacer()
            
                    Button {
                        withAnimation {
                            
                            self.animateCard = false
                        }
                        
                        Deal()
                        playSound(sound: "flip-card", type: "mp3")
                        
                        withAnimation {
                            self.animateCard = true
                        }
                        
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
                                Button("Win", action: {
                                    SpecialWinDeal()
                                    playSound(sound: "flip-card", type: "mp3")
                                })
                                Button("Lose", action: {
                                    SpecialLoseDeal()
                                    playSound(sound: "flip-card", type: "mp3")
                                })
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
                            ? VStack {
                                Text("You won congratulations!!!").foregroundColor(.white)
                                Image("you-win")
                            }.onAppear(perform: {
                                playSound(sound: "win-effect", type: "mp3")
                            })
                            : VStack {
                                Text("You lost!!! Game over!").foregroundColor(.white)
                                Image("you-lose")
                            }.onAppear(perform: {
                                playSound(sound: "lose-effect", type: "mp3")
                            })
                            
                            Spacer()
                            Text("Kindly navigate back to homescreen for a restart").foregroundColor(.white).padding(.bottom, 20).padding(.horizontal, 20)
                            Button {
                                updateLeaderboard()
                                playSound(sound: "pencil-check", type: "mp3")
                            } label: {
                                Text("Add your score to the leaderboards").padding(.all, 9).overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color("yellow-2"), lineWidth: 4)
                                ).padding(.bottom, 20)
                            }

                        }
                    }.frame(width: 280, height: 400).shadow(color: Color.black,radius: 100).cornerRadius(20)
                }
            }.navigationBarTitle("Card War").sheet(isPresented: $isShowingSheet){
                SheetView()
        }
        }
        
    }
    
    // MARK: GAME LOGIC
    
    
    
    // MARK: NORMAL DEALING
    func Deal(){
        
        self.randNum1 = Int.random(in: 2...13)
        
        if (difficulty == "Hard") {
            
            self.randNum2 = Int.random(in: 2...13)
            self.counter += 1
            
            if(self.counter % 3 == 0){
                self.randNum2 = 12
            }
            
        } else if (difficulty == "Medium") {
            
            self.randNum2 = Int.random(in: 2...13)
            self.counter += 1
            
            if (self.counter % 3 == 0) {
                self.randNum2 = 10
            }
            
        } else {
            self.randNum2 = Int.random(in: 2...13)
        }
        
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
        
        if (difficulty == "Hard") {
            
            self.randNum2 = Int.random(in: 2...13)
            self.counter += 1
            
            if(self.counter % 3 == 0){
                self.randNum2 = 12
            }
            
        } else if (difficulty == "Medium") {
            
            self.randNum2 = Int.random(in: 2...13)
            self.counter += 1
            
            if (self.counter % 3 == 0) {
                self.randNum2 = 10
            }
            
        } else {
            self.randNum2 = Int.random(in: 2...13)
        }
        
        if self.randNum1 > self.randNum2 {
            SpecialWinDealWin()
        }
        if self.randNum1 < self.randNum2 {
            SpecialWinDealLose()
        }
    }
    func SpecialLoseDeal(){
        self.randNum1 = Int.random(in: 2...13)
        
        if (difficulty == "Hard") {
            
            self.randNum2 = Int.random(in: 2...13)
            self.counter += 1
            
            if(self.counter % 3 == 0){
                self.randNum2 = 12
            }
            
        } else if (difficulty == "Medium") {
            
            self.randNum2 = Int.random(in: 2...13)
            self.counter += 1
            
            if (self.counter % 3 == 0) {
                self.randNum2 = 10
            }
            
        } else {
            self.randNum2 = Int.random(in: 2...13)
        }
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
    
    func updateLeaderboard(){
        if(self.showWinMessage == true){
            addPlayer(playerName: username, playerScore: playerScore, playerAchievement: difficulty)
        } else {
            addPlayer(playerName: username, playerScore: playerScore, playerAchievement: "")
        }
    }
}


//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView()
//    }
//}



