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
            
        
                Spacer()
            
            List{
                Text("First item").foregroundColor(.black).listRowBackground(Color("yellow-1"))
                Text("Second item").foregroundColor(.black).listRowBackground(Color("yellow-1"))
            }.scrollContentBackground(.hidden)
            
        }.navigationTitle("Leaderboards").foregroundColor(.white)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
