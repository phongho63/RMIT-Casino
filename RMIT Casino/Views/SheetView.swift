//
//  SheetView.swift
//  RMIT Casino
//
//  Created by Ho Buu Quoc Phong on 05/09/2023.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        TutorialView()
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
