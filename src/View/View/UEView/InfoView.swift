//
//  InfoDetail.swift
//  View
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI

struct InfoView: View {
    
    var icon: String
    var text: String
    
    var body: some View {
        HStack {
            Button {} label: {
                Label("", systemImage: icon).foregroundColor(Color(ColorAssets.ICONCOLOR))
            }
            Text(text)
        }
    }
    
    init(icon: String, text: String) {
        self.icon = icon
        self.text = text
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(icon: "xmark.circle.fill", text: "coefficient : 6")
    }
}
