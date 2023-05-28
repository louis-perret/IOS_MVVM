//
//  UEVM.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import Modele

extension UE {
    struct Data: Identifiable {
        public let id:UUID
        public var name: String
        public var coef: Int
        public var matieres: [Matiere.Data]
    }
    
    var data: Data { Data(id:self.id, name: self.name, coef: coef, matieres: [])}
    
    mutating func update(from data: Data) {
        guard data.id == self.id else { return }
        self.name = data.name
        self.coef = data.coef
       //  self.matieres = data.matieres.map{ }
    }
}

class UEVM : ObservableObject, Identifiable {
    public let id:UUID
    var original: UE
    @Published var model = UE.Data(id: UUID(), name: "", coef: 0, matieres: [])
    @Published var isEdited = false
    public var matieres: [MatiereVM] = []
    
    public var moyenne: Float {
        get {
            original.moyenne
        }
    }
    
    init(withUE ue: UE, andId id : UUID){
        self.original = ue
        model = original.data
        self.id = id
        original.matieres.forEach { m in matieres.append(MatiereVM(withMatiere: m)) }
    }
    
    public func onEditing(){
        model = original.data
        isEdited = isEdited ? false : true
    }
    
    public func onEdited(isCancelled: Bool = false){
        if(!isCancelled){
            original.update(from: model)
        }
        isEdited = false
    }
}
