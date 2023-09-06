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


import Foundation
import CoreLocation

var playersEntity: [PlayerEntity] = []
    
    
func addPlayer(playerName: String, playerScore: Int, playerAchievement: String){
        let player = PlayerEntity(username: playerName, score: playerScore, achievement: playerAchievement)
        playersEntity.append(player)
}

var sortedEntities: [PlayerEntity] {
    return playersEntity.sorted(by: {$0.score > $1.score})
}



