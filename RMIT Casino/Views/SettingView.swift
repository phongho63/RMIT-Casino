//
//  SettingView.swift
//  RMIT Casino
//
//  Created by Ho Buu Quoc Phong on 04/09/2023.
//

import SwiftUI

struct SettingView: View {
    
    //@AppStorage ("difficulty") var selection = "Standard"
    
    @StateObject var globalString = GlobalString()
    
    let difficulties = ["Standard", "Medium", "Hard"]
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("green-1"), Color("yellow-1")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            ScrollView {
                    
                ZStack {
                    
                    VStack {
                            
                            HStack{
                                
                                VStack {
                                    
                                    Text("Configurations")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                
                                Spacer()
                                
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 20)
                            
                            Divider()
                                .frame(height: 1)
                                .overlay(.black)
                                .padding(.horizontal, 20)
                            
                            Text("Difficulty settings").foregroundColor(.white).font(.title2).padding(.vertical, 10)
                            
                        Picker("Select a difficulty", selection: $globalString.difficulty){
                                ForEach(difficulties, id: \.self){
                                    Text($0)
                                }
                            }.pickerStyle(.menu)
                            
                            HStack {
                                Text("Selected difficulty:")
                                    .padding(.bottom, 20).foregroundColor(.white)
                                Text(globalString.difficulty).padding(.bottom, 20).foregroundColor((globalString.difficulty == difficulties[0]) ? .green : (globalString.difficulty == difficulties[1]) ? .yellow : .red)
                            }
                            
                        (globalString.difficulty == difficulties[0])
                            ?
                        Text("Standard gameplay with no manipulation").foregroundColor(.green).underline()
                            :
                        (globalString.difficulty == difficulties[1])
                            ?
                            Text("Every third deal the CPU gets a 10").foregroundColor(.yellow).underline()
                            :
                            Text("Every third deal the CPU gets a queen").foregroundColor(.red).bold().underline()
                            
                            Divider().frame(height: 1).overlay(.black).padding(.horizontal, 20)
                    }
                }
                
            }.background(Color("green-1")).frame(width: 380, height: 730).shadow(color: Color.black,radius: 100).cornerRadius(20)
        }.navigationTitle("Settings")
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
