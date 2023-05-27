//
//  File.swift
//  
//
//  Created by etudiant on 25/05/2023.
//

import Foundation

public func calculMoyenne(notes: [Float]) -> Float {
    var counts = 0
    var totalNotes: Float = 0.0
    notes.forEach { note in
        if(note >= 0) { // si < 0 -> note non renseignée
            counts = counts + 1
            totalNotes = totalNotes + note
        }
    }
    return totalNotes / Float(counts)
}

public struct Odin : Identifiable {
    
    public let id:UUID
    public var blocs: [Bloc]
    public var ues: [UE]
    
    public init(id: UUID, blocs: [Bloc], ues: [UE]){
        self.id = id
        self.blocs = blocs
        self.ues = ues
    }
    
    public init(){
        self.init(id:UUID(), blocs: [], ues: [])
    }
}
