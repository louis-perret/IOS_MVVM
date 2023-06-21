//
//  File.swift
//  
//
//  Created by etudiant on 25/05/2023.
//

import Foundation

// Représente une UE (une UE étant un regroupement de matières)
public struct UE:Identifiable, Equatable, Codable {
    
    public let id:UUID
    public var name: String
    public var coef: Int
    public var matieres: [Matiere]
    public var moyenne: Float {
        get {
            var notes: [Float] = []
            matieres.forEach{ matiere in for _ in 0...matiere.coef { notes.append(matiere.moyenne) } }
            return calculMoyenne(notes: notes )
        }
        set{
            
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
    
    public static func == (lhs: UE, rhs: UE) -> Bool {
        lhs.id == rhs.id
    }
}
