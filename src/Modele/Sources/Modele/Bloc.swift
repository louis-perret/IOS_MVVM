//
//  File.swift
//  
//
//  Created by etudiant on 25/05/2023.
//

import Foundation

public struct Bloc:Identifiable {
    
    public let id:UUID
    public var nom: String
    public var listeUE : [UE]
    public var moyenne: Float {
        var notes: [Float] = []
        listeUE.forEach{ ue in notes.append(ue.moyenne) }
        return calculMoyenne(notes: notes )
    }
    
    public init(id: UUID, nom: String, listeUE: [UE]) {
        self.id = id
        self.nom = nom
        self.listeUE = listeUE
    }
    
    public init(listeUE: [UE]) {
        self.init(id: UUID(), nom: "Sans nom", listeUE: listeUE)
    }
}
