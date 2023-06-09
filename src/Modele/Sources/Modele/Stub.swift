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
        
        
        let ue1 = UE(id: UUID(), name: "UE1 Génie Logiciel", coef: 6, matieres: [
            Matiere(id: UUID(), name: "Processus de développement", coef: 4, moyenne: 11.75),
            Matiere(id: UUID(), name: "Programmation object", coef: 9, moyenne: 14.83),
            Matiere(id: UUID(), name: "Qualité de développement", coef: 5, moyenne: 13.9),
            Matiere(id: UUID(), name: "Remise à niveau", coef: 4, moyenne: 17)
        ])
        
        let ue2 = UE(id: UUID(), name: "UE2 Système et réseau", coef: 6, matieres: [
            Matiere(id: UUID(), name: "Internet des objets", coef: 4, moyenne: -1),
            Matiere(id: UUID(), name: "Réseaux", coef: 4, moyenne: 15.5),
            Matiere(id: UUID(), name: "Services Mobiles", coef: 4, moyenne: 18),
            Matiere(id: UUID(), name: "Système", coef: 5, moyenne: 12.38)
        ])
        
        let ue3 = UE(id: UUID(), name: "UE3 Insertion Professionnelle", coef: 6, matieres: [
            Matiere(id: UUID(), name: "Anglais", coef: 5, moyenne: 10.8),
            Matiere(id: UUID(), name: "Communication", coef: 4, moyenne: 16),
            Matiere(id: UUID(), name: "Economie", coef: 4, moyenne: 14.5),
            Matiere(id: UUID(), name: "Gestion", coef: 3, moyenne: -1)
        ])
        
        let ue4 = UE(id: UUID(), name: "UE4 Technologies Mobiles 1", coef: 9, matieres: [
            Matiere(id: UUID(), name: "Android", coef: 6, moyenne: 16),
            Matiere(id: UUID(), name: "Architecture de projets C# .NET (1)", coef: 5, moyenne: 14.5),
            Matiere(id: UUID(), name: "C++", coef: 4, moyenne: 16.78),
            Matiere(id: UUID(), name: "Swift", coef: 5, moyenne: 15)
        ])
        
        let ue5 = UE(id: UUID(), name: "UE5 Technologies Mobiles 2", coef: 9, matieres: [
            Matiere(id: UUID(), name: "Architecture de projets C# .NET (2)", coef: 4, moyenne: 14),
            Matiere(id: UUID(), name: "Client/Serveur", coef: 4, moyenne: -1),
            Matiere(id: UUID(), name: "iOS", coef: 5, moyenne: -1),
            Matiere(id: UUID(), name: "Multiplateforme", coef: 3, moyenne: -1),
            Matiere(id: UUID(), name: "QT QUICK", coef: 5, moyenne: -1),
            Matiere(id: UUID(), name: "MAUI", coef: 5, moyenne: -1)
        ])
        
        let ue6 = UE(id: UUID(), name: "UE6 Projet", coef: 9, matieres: [
            Matiere(id: UUID(), name: "Projet", coef: 1, moyenne: 17.70)
        ])
        
        let ue7 = UE(id: UUID(), name: "UE7 Stage", coef: 15, matieres: [
            Matiere(id: UUID(), name: "Stage", coef: 1, moyenne: -1)
        ])
        
        odin.ues.append(ue1)
        odin.ues.append(ue2)
        odin.ues.append(ue3)
        odin.ues.append(ue4)
        odin.ues.append(ue5)
        odin.ues.append(ue6)
        odin.ues.append(ue7)
        let bloc1 = Bloc(id: UUID(), name: "Total",ues: [ue1, ue2, ue3, ue4, ue5])
        let bloc2 = Bloc(id: UUID(), name: "Stage/Projet", ues: [ue6, ue7])
        odin.blocs.append(bloc1)
        odin.blocs.append(bloc2)
        return odin
        
    }
    
}
