//
//  PlayerEntity.swift
//  RMIT Casino
//
//  Created by Ho Buu Quoc Phong on 05/09/2023.
//

import SwiftUI
import Foundation

struct PlayerEntity: Identifiable {
    let id = UUID()
    let username: String
    let score: Int
    let achievements: String
    
}
