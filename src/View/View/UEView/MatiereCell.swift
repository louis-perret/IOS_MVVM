//
//  MatiereCell.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI
import ViewModel
import Modele

// Affiche une matière
struct MatiereCell: View {
    
    private static let ICONOPENEDLOCK: String = "lock.open" // cadenas ouvert signifiant l'édition possible
    private static let ICONCLOSEDLOCK: String = "lock" // cadenas fermé signifiant qu'aucune édition n'est possible
    
    @ObservedObject var matiere: MatiereVM // Matière à afficher
    @State var icon: String = MatiereCell.ICONCLOSEDLOCK // Cadenas à afficher (change dynamiquement)
    @State var colorRectangle: String = ColorAssets.COLORRECTANGLEGREEN // Couleur du rectangle représentant la moyenne de la matière (rouge si c'est dernière est < 10)
    
    // Drag gesture pour gérer la modification de la moyenne par déplacementx
    var dragGestureMoyenne: some Gesture {
        DragGesture()
            .onChanged { value in
                if matiere.isEdited {
                    if value.translation.width < 0 { // drag vers la gauche
                        if matiere.moyenne > 0.10 {
                            matiere.moyenne = matiere.moyenne - Float(0.10)
                        }
                    }
                    else { // drag vers la droite
                        if matiere.moyenne < 19.90 {
                            matiere.moyenne = matiere.moyenne + Float(0.10)
                        }
                        else {
                            matiere.moyenne = 20
                        }
                    }
                    
                    if matiere.moyenne < 10 { // on update la couleur si ça dépasse ou non 10
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
                Label("", systemImage: icon).foregroundColor(Color(ColorAssets.PRIMARYCOLOR))
            }
            VStack {
                HStack {
                    TextField("Nom", text: $matiere.name).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)).foregroundColor(Color(ColorAssets.TEXTCOLOR)).disabled(!matiere.isEdited)
                    Spacer()
                    TextField("Coef", value: $matiere.coef, formatter: NumberFormatter()).foregroundColor(Color(ColorAssets.TEXTCOLOR)).disabled(!matiere.isEdited).fixedSize()
                    
                }
                
                HStack {
                    Capsule()
                        .fill(Color(colorRectangle))
                        //.frame(width: geometry.size.width * 0.60 * (CGFloat(moyenne)*0.05) , height: geometry.size.height * 0.04)
                        .frame(width: UIScreen.main.bounds.width * 0.60 * (CGFloat(matiere.moyenne)*0.05) , height: UIScreen.main.bounds.height * 0.04)
                        .gesture(dragGestureMoyenne)
                    //TextField("", value:$matiere.model.moyenne, formatter: NumberFormatter()).foregroundColor(Color(ColorAssets.TEXTCOLOR)).disabled(true)
                    Text(String(format:"%.2f", matiere.moyenne)).foregroundColor(Color(ColorAssets.TEXTCOLOR))
                    Spacer()
                }
                Divider()
            }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }.padding()
    }
    
    init(matiere: MatiereVM) {
        self.matiere = matiere
        if self.matiere.isEdited {
            icon = MatiereCell.ICONOPENEDLOCK
        }
        else {
            icon = MatiereCell.ICONCLOSEDLOCK
        }
    }
    
    // Set l'image du cadenas
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

