//
//  File.swift
//  
//
//  Created by etudiant on 25/05/2023.
//

import Foundation

public struct Bloc:Identifiable, Equatable {
    
    public let id:UUID
    public var name: String
    public var ues : [UE]
    public var moyenne: Float {
        var notes: [Float] = []
        ues.forEach{ ue in notes.append(ue.moyenne) }
        return calculMoyenne(notes: notes )
    }
    
    public init(id: UUID, name: String, ues: [UE]) {
        self.id = id
        self.name = name
        self.ues = ues
    }
    
    public init(listeUE: [UE]) {
        self.init(id: UUID(), name: "Sans nom", ues: listeUE)
    }
}
