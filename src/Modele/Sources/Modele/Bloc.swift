//
//  File.swift
//  
//
//  Created by etudiant on 25/05/2023.
//

import Foundation

public struct Bloc:Identifiable {
    
    public let id:UUID
    public var listeUE : [UE]
    public var moyenne: Float {
        let totalCoefficients = listeUE.reduce(into: 0.0) { $0 + Float($1.coef)}
        let weightedGrades = listeUE.reduce(into: 0.0) { $0 + $1.moyenne * Float($1.coef) }
        return weightedGrades / totalCoefficients
    }
    
    public init(id: UUID, listeUE: [UE]) {
        self.id = id
        self.listeUE = listeUE
    }
    
    public init(listeUE: [UE]) {
        self.init(id: UUID(), listeUE: listeUE)
    }
    
}
