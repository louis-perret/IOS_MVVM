//
//  UEVM.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import Modele

class UEVM : BaseVM, Identifiable {
    @Published var model: UE
    
    public var id:UUID { model.id }
    
    @Published
    var name:String = "" {
        didSet {
            if self.model.name != self.name {
                self.model.name = self.name;
            }
        }
    }
    
    @Published
    var coef:Int = 0 {
        didSet {
            if self.model.coef != self.coef {
                self.model.coef = self.coef;
            }
        }
    }
    
    @Published
    var moyenne:Float = 0 {
        didSet {
            if self.model.moyenne != self.moyenne {
                self.model.moyenne = self.moyenne;
            }
        }
    }
    
    public var matieres: [MatiereVM] = []
    
    private var copy : UEVM {
        UEVM(withUE: self.model)
    }
    @Published var isEditing = false
    var editedCopy : UEVM?
    
    init(withUE ue: UE){
        self.model = ue
        // model.matieres.forEach { m in matieres.append(MatiereVM(withMatiere: m)) }
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
}
