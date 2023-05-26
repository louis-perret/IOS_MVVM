//
//  File.swift
//  
//
//  Created by etudiant on 25/05/2023.
//

import Foundation

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
