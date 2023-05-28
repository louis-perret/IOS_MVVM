//
//  UEDetailView.swift
//  View
//
//  Created by etudiant on 28/05/2023.
//

import SwiftUI
import Modele

struct UEDetailView: View {
    
    var colorRectangle: String = ColorAssets.COLORRECTANGLEGREEN
    @ObservedObject var ue: UEVM
    
    var body: some View {
        VStack {
            HStack {
                TextField("Nom", text: $ue.model.name).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)).foregroundColor(Color(ColorAssets.TEXTCOLOR)).disabled(!ue.isEdited)
                Spacer()
                TextField("Coef", value: $ue.model.coef, formatter: NumberFormatter()).foregroundColor(Color(ColorAssets.TEXTCOLOR)).disabled(!ue.isEdited).fixedSize()
            }
            
            HStack {
                Capsule()
                    .fill(Color(colorRectangle))
                    //.frame(width: geometry.size.width * 0.60 * (CGFloat(moyenne)*0.05) , height: geometry.size.height * 0.04)
                    .frame(width: UIScreen.main.bounds.width * 0.60 * (CGFloat(ue.moyenne)*0.05) , height: UIScreen.main.bounds.height * 0.04)
                Text(String(ue.moyenne)).foregroundColor(Color(ColorAssets.TEXTCOLOR))
                Spacer()
            }
            Divider()
        }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
    }
}

struct UEDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UEDetailView(ue: UEVM(withUE: Stub.Odin.ues[0], andId: UUID()))
    }
}
