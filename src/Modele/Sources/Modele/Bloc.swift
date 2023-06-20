//
//  File.swift
//  
//
//  Created by etudiant on 25/05/2023.
//

import Foundation

// Représente un Bloc (un bloc étant un regroupement d'UE)
public struct Bloc:Identifiable, Equatable {
    
    
    public let id:UUID
    public var name: String
    public var ues : [UE] // Liste des UEs
    // Moyenne calculée sur chaque UE en fonction de son coefficient
    public var moyenne: Float {
        var notes: [Float] = []
        ues.forEach{ ue in for _ in 0...ue.coef { notes.append(ue.moyenne) } }
        return calculMoyenne(notes: notes )
    }
    
    // Init
    public init(id: UUID, name: String, ues: [UE]) {
        self.id = id
        self.name = name
        self.ues = ues
    }
    
    // init avec une liste prédéfinis d'UE
    public init(listeUE: [UE]) {
        self.init(id: UUID(), name: "Sans nom", ues: listeUE)
    }
}
