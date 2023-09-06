//
//  GlobalEntity.swift
//  RMIT Casino
//
//  Created by Ho Buu Quoc Phong on 06/09/2023.
//

import SwiftUI

class GlobalString: ObservableObject{
    @AppStorage ("difficulty") var difficulty = "Standard"
    
}
