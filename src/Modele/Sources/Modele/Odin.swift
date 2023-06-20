//
//  File.swift
//  
//
//  Created by etudiant on 25/05/2023.
//

import Foundation

// Effectue une moyenne sur un jeu de données
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

// Représente le manager des blocs
public struct Odin : Identifiable {
    
    public let id:UUID
    public var blocs: [Bloc] // Liste ded blocs à gérer
    public var ues: [UE] { getUEs() } // Toutes les ues réparties au sein des blocs
    
    // Init
    public init(id: UUID, blocs: [Bloc]){
        self.id = id
        self.blocs = blocs
    }
    
    public init(){
        self.init(id:UUID(), blocs: [])
    }
    
    // Récupère toutes les ues de tous les blocs
    public func getUEs()-> [UE] {
        var res : [UE] = []
        self.blocs.forEach { bloc in bloc.ues.forEach { ue in res.append(ue) } }
        return res
    }
}
