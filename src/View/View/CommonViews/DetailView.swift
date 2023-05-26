//
//  CapsuleView.swift
//  View
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import Modele

struct DetailView: View {
    
    var title: String
    var moyenne: Float
    var coef: Int
    var colorRectangle: String = ColorAssets.COLORRECTANGLEGREEN
    
    var body: some View {
        //GeometryReader { geometry in
            VStack {
                HStack {
                    Text(title).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    Spacer()
                    Text(String(coef))
                }
                
                HStack {
                    Capsule()
                        .fill(Color(colorRectangle))
                        //.frame(width: geometry.size.width * 0.60 * (CGFloat(moyenne)*0.05) , height: geometry.size.height * 0.04)
                        .frame(width: UIScreen.main.bounds.width * 0.60 * (CGFloat(moyenne)*0.05) , height: UIScreen.main.bounds.height * 0.04)
                    Text(String(moyenne))
                    Spacer()
                }
                Divider()
            }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            
       // }
        
    }
    
    init(title: String, moyenne: Float, coef: Int) {
        self.title = title
        self.moyenne = moyenne
        self.coef = coef
    }
}

struct CapsuleView_Previews: PreviewProvider {
    static var previews: some View {
        var matiere: Matiere = Stub.Odin.ues[0].matieres[0]
        DetailView(title: matiere.name, moyenne: matiere.moyenne, coef: matiere.coef)
    }
}
