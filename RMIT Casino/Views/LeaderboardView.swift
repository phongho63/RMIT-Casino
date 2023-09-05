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
            
            VStack {
                Text("Leaderboards").foregroundColor(.white).font(.title).bold()
                Spacer()
            }
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
