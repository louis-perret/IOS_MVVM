//
//  MatiereCell.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI
import Modele

struct MatiereCell: View {
    
    private static let ICONOPENEDLOCK: String = "lock.open"
    private static let ICONCLOSEDLOCK: String = "lock"
    
    @ObservedObject var matiere: MatiereVM
    @State var icon: String = MatiereCell.ICONCLOSEDLOCK
    @State var colorRectangle: String = ColorAssets.COLORRECTANGLEGREEN
    var dragGestureMoyenne: some Gesture {
        DragGesture()
            .onChanged { value in
                if matiere.isEdited {
                    if value.translation.width < 0 { // drag vers la gauche
                        if matiere.model.moyenne >= 0.10 {
                            matiere.model.moyenne = matiere.model.moyenne - Float(0.10)
                        }
                    }
                    else { // drag vers la droite
                        if matiere.model.moyenne <= 19.90 {
                            matiere.model.moyenne = matiere.model.moyenne + Float(0.10)
                        }
                    }
                    
                    if matiere.model.moyenne < 10 {
                        colorRectangle = ColorAssets.COLORRECTANGLERED
                    }
                    else {
                        colorRectangle = ColorAssets.COLORRECTANGLEGREEN
                    }
                }
            }
    }
    
    var body: some View {
        HStack {
            Button{setIsEditing()} label: {
                Label("", systemImage: icon).foregroundColor(Color(ColorAssets.ICONCOLOR))
            }
            VStack {
                HStack {
                    TextField("Nom", text: $matiere.model.name).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)).foregroundColor(Color(ColorAssets.TEXTCOLOR)).disabled(!matiere.isEdited)
                    Spacer()
                    TextField("Coef", value: $matiere.model.coef, formatter: NumberFormatter()).foregroundColor(Color(ColorAssets.TEXTCOLOR)).disabled(!matiere.isEdited).fixedSize()
                }
                
                HStack {
                    Capsule()
                        .fill(Color(colorRectangle))
                        //.frame(width: geometry.size.width * 0.60 * (CGFloat(moyenne)*0.05) , height: geometry.size.height * 0.04)
                        .frame(width: UIScreen.main.bounds.width * 0.60 * (CGFloat(matiere.model.moyenne)*0.05) , height: UIScreen.main.bounds.height * 0.04)
                        .gesture(dragGestureMoyenne)
                    //TextField("", value:$matiere.model.moyenne, formatter: NumberFormatter()).foregroundColor(Color(ColorAssets.TEXTCOLOR)).disabled(true)
                    Text(String(format:"%.2f", matiere.model.moyenne)).foregroundColor(Color(ColorAssets.TEXTCOLOR))
                    Spacer()
                }
                Divider()
            }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }.padding()
    }
    
    init(matiere: MatiereVM) {
        self.matiere = matiere
    }
    
    private func setIsEditing() {
        if matiere.isEdited {
            matiere.isEdited = false
            icon = MatiereCell.ICONCLOSEDLOCK
            matiere.onEdited()
        }
        else {
            matiere.isEdited = true
            icon = MatiereCell.ICONOPENEDLOCK
        }
    }
    
    
}

struct MatiereCell_Previews: PreviewProvider {
    static var previews: some View {
        MatiereCell(matiere: MatiereVM(withMatiere: Stub.Odin.ues[0].matieres[0]))
    }
}

