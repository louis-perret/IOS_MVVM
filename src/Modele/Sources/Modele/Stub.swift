//
//  File.swift
//  
//
//  Created by etudiant on 25/05/2023.
//

import Foundation

public struct Stub {
    
    public static var Odin: Odin {
        var odin = Modele.Odin()
        
        var ue = UE(id: UUID(), name: "UE1 Génie Logiciel", coef: 6, matieres: [
            Matiere(id: UUID(), name: "Processus de développement", coef: 4, moyenne: 11.75),
            Matiere(id: UUID(), name: "Programmation object", coef: 9, moyenne: 14.83),
            Matiere(id: UUID(), name: "Qualité de développement", coef: 5, moyenne: 13.9),
            Matiere(id: UUID(), name: "Remise à niveau", coef: 4, moyenne: 17),
        ])
        odin.ues.append(ue)
        return odin
        
    }
    
}
