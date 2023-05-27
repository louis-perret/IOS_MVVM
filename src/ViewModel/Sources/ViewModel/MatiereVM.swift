//
//  MatiereVM.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import Modele

extension Matiere {
    struct Data: Identifiable {
        public let id:UUID
        public var name: String
        public var coef: Int
    }
    
    var data: Data { Data(id:self.id, name: self.name, coef: coef)}
    
    mutating func update(from data: Data) {
        guard data.id == self.id else { return }
        self.name = data.name
        self.coef = data.coef
    }
}

class MatiereVM : ObservableObject, Identifiable {
    public let id:UUID
    var original: Matiere
    @Published var model = Matiere.Data(id: UUID(), name: "", coef: 0)
    @Published var isEdited = false
    var moyenne: Float {
        get {
            original.moyenne
        }
    }
    
    init(withMatiere matiere: Matiere){
        self.original = matiere
        model = original.data
        self.id = original.id
    }
    
    func onEditing(){
        model = original.data
        isEdited = true
    }
    
    func onEdited(isCancelled: Bool = false){
        if(!isCancelled){
            original.update(from: model)
        }
        isEdited = false
    }
}
