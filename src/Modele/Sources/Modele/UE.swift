//
//  File.swift
//  
//
//  Created by etudiant on 25/05/2023.
//

import Foundation

public struct UE:Identifiable {
    
    public let id:UUID
    public var name: String
    public var coef: Int
    public var matieres: [Matiere]
    public var moyenne: Float {
        get {
            calculMoyenne()
        }
    }
    
    public init(id: UUID, name: String, coef: Int, matieres: [Matiere]) {
        self.id = id
        self.name = name
        self.coef = coef
        self.matieres = matieres
    }
    
    public init(name: String, coef: Int, matieres: [Matiere]) {
        self.init(id: UUID(), name: name, coef: coef, matieres: matieres)
    }
    
    public func calculMoyenne() -> Float {
        var counts = 0
        var totalMatieres: Float = 0.0
        matieres.forEach { matiere in
            counts = counts + 1
            totalMatieres = totalMatieres + matiere.moyenne
        }
        return totalMatieres / Float(counts)
    }
}
