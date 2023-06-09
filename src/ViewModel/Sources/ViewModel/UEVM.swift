//
//  UEVM.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import Modele

class UEVM : BaseVM, Identifiable, Equatable {
    
    @Published var model: UE {
        didSet {
            if self.name != self.model.name {
                self.name = self.model.name;
            }
            if self.coef != self.model.coef {
                self.coef = self.model.coef;
            }
            if !self.model.matieres.compare(to: self.matieres.map({$0.model})){
                self.matieres = self.model.matieres.map({MatiereVM(withMatiere: $0)})
            }
        }
    }
    
    public var id:UUID { model.id }
    
    @Published
    public var name:String = "" {
        didSet {
            if self.model.name != self.name {
                self.model.name = self.name;
            }
        }
    }
    
    @Published
    public var coef:Int = 0 {
        didSet {
            if self.model.coef != self.coef {
                self.model.coef = self.coef;
            }
        }
    }
    
    
    public var moyenne:Float { model.moyenne }
    
    @Published public var matieres: [MatiereVM] = [] {
        didSet {
            let someMatieresModel = self.matieres.map({$0.model})
            if !self.model.matieres.compare(to: someMatieresModel){
                self.model.matieres = self.matieres.map({$0.model})
            }
        }
    }
    
    private var copy : UEVM {
        UEVM(withUE: self.model)
    }
    
    @Published public var isEditing = false
    public var editedCopy : UEVM?
    
    public init(withUE ue: UE){
        self.model = ue
        self.matieres = ue.matieres.map({MatiereVM(withMatiere: $0)})
        // ue.matieres.forEach { m in matieres.append(MatiereVM(withMatiere: m)) }
    }
    
    public func onEditing(){
        editedCopy = copy
        isEditing = true
    }
    
    public func onEdited(isCancelled: Bool = false){
        if(!isCancelled){
            if let editedCopy = editedCopy {
                self.model = editedCopy.model
            }
        }
        isEditing = false
        editedCopy = nil
    }
    
    public func matiereHasChanged(vm: MatiereVM) {
        var matiereModel = model.matieres.first(where: { $0.id == vm.id} )
        matiereModel!.name = name
        matiereModel!.coef = coef
        matiereModel!.moyenne = moyenne
    }
    
    static func == (lhs: UEVM, rhs: UEVM) -> Bool {
        lhs.id == rhs.id
    }
}
