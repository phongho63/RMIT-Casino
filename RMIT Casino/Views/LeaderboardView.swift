//
//  LeaderboardView.swift
//  RMIT Casino
//
//  Created by Ho Buu Quoc Phong on 04/09/2023.
//

import SwiftUI

struct LeaderboardView: View {
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("green-1"), Color("yellow-1")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
    
            if(playersEntity.isEmpty){
                VStack {
                    Text("Currently there is nothing to display").foregroundColor(.white)
                }
            } else {
                List(sortedEntities, id: \.username){
                    player in DataRowView(player: player).listRowBackground(Color("yellow-1"))
                    
                }.scrollContentBackground(.hidden)
            }
        }.onAppear(perform: {
            playSound(sound: "boba-date", type: "mp3")
        }).navigationTitle("Leaderboards").foregroundColor(.white)
    }
}

//struct LeaderboardView_Previews: PreviewProvider {
//    static var previews: some View {
//        LeaderboardView()
//    }
//}
