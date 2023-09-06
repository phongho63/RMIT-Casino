//
//  PlayerDatabaseEntity.swift
//  RMIT Casino
//
//  Created by Ho Buu Quoc Phong on 06/09/2023.
//


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



