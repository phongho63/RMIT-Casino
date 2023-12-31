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

struct SettingView: View {
    
    
    @StateObject var globalString = GlobalString()
    
    // Set up a range of selection for difficulties
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
                            
                        // Creating a picker item for difficuty choosing
                        
                        Picker("Select a difficulty", selection: $globalString.difficulty){
                            
                                ForEach(difficulties, id: \.self){
                                    
                                    Text($0)
                                    
                                }
                            }
                        .pickerStyle(.menu)
                            
                        HStack {
                            
                            Text("Selected difficulty:")
                                .padding(.bottom, 20)
                                .foregroundColor(.white)
                            
                            // Color indicator condition for difficulties
                            Text(globalString.difficulty)
                                .padding(.bottom, 20)
                                .foregroundColor((globalString.difficulty == difficulties[0]) ? .green : (globalString.difficulty == difficulties[1]) ? .yellow : .red)
                            
                        }
                            
                        // Description response for each difficulties
                        
                        (globalString.difficulty == difficulties[0])
                            ?
                        Text("Standard gameplay with no manipulation")
                            .foregroundColor(.green)
                            .underline()
                            :
                        (globalString.difficulty == difficulties[1])
                            ?
                            Text("Every third deal the CPU gets a 10")
                            .foregroundColor(.yellow)
                            .underline()
                            :
                            Text("Every third deal the CPU gets a queen")
                            .foregroundColor(.red)
                            .bold()
                            .underline()
                            
                            Divider()
                            .frame(height: 1)
                            .overlay(.black)
                            .padding(.horizontal, 20)
                    }
                }
                
            }
            .background(Color("green-1"))
            .frame(width: 380, height: 730)
            .shadow(color: Color.black,radius: 100)
            .cornerRadius(20)
            
        }
        .navigationTitle("Settings")
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
