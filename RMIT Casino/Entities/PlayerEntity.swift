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
import SwiftUI

struct PlayerEntity {
    
    // Creating player objects to store
    @AppStorage("username") var username: String = ""
    @AppStorage("score") var score: Int = 0
    @AppStorage("achievement") var achievement : String = ""
    
    }
