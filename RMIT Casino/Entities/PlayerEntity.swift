//
//  PlayerEntity.swift
//  RMIT Casino
//
//  Created by Ho Buu Quoc Phong on 05/09/2023.
//

import Foundation
import SwiftUI

struct PlayerEntity {
    @AppStorage("username") var username: String = ""
    @AppStorage("score") var score: Int = 0
    @AppStorage("achievement") var achievement : String = ""
    }
