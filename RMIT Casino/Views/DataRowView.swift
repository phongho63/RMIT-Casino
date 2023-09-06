//
//  DataRowView.swift
//  RMIT Casino
//
//  Created by Ho Buu Quoc Phong on 06/09/2023.
//

import SwiftUI

struct DataRowView: View {
    
    @StateObject var globalString = GlobalString()
    
    var player: PlayerEntity
    
    var body: some View {
        VStack {
            HStack{
                Text("\(player.username)").foregroundColor(.black)
                Spacer()
                Text("\(player.score)").foregroundColor(.black)
                
            }
            Divider().frame(height: 1).padding(.horizontal, 20).overlay(.black)
                        
            HStack{
                Image(systemName: (player.achievement == "Standard") ? "person.badge.shield.checkmark" : (player.achievement == "Medium") ? "figure.and.child.holdinghands" : (player.achievement == "Hard") ? "figure.roll" : "flag.fill")
                                
                Text((player.achievement != "") ? "Defeated the CPU" : "Did not collect any achievements").foregroundColor(.black)


            }
        }
    }
}

//struct DataRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        DataRowView()
//    }
//}
