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
    public var ues: [UE] { getUEs() }
    
    public init(id: UUID, blocs: [Bloc]){
        self.id = id
        self.blocs = blocs
    }
    
    public init(){
        self.init(id:UUID(), blocs: [])
    }
    
    public func getUEs()-> [UE] {
        var res : [UE] = []
        self.blocs.forEach { bloc in bloc.ues.forEach { ue in res.append(ue) } }
        return res
    }
}
