//
//  MatiereVM.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import Modele


class MatiereVM : BaseVM, Identifiable {
    
    @Published var model: Matiere {
        didSet {
            if self.name != model.name {
                self.name = model.name;
            }
            if self.coef != model.coef {
                self.coef = model.coef;
            }
            if self.moyenne != model.moyenne {
                self.moyenne = model.moyenne;
            }
        }
    }
    
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
    private var copy : MatiereVM {
        MatiereVM(withMatiere: self.model)
    }
    @Published var isEdited = false
    var editedCopy : MatiereVM?

    init(withMatiere matiere: Matiere){
        self.model = matiere
    }
    
    func onEditing(){
        editedCopy = copy
        isEdited = true
    }
    
    func onEdited(isCancelled: Bool = false){
        if(!isCancelled){
            if let editedCopy = editedCopy {
                self.model = editedCopy.model
            }
        }
        isEdited = false
        editedCopy = nil
    }
    
    static func == (lhs: MatiereVM, rhs: MatiereVM) -> Bool {
        lhs.id == rhs.id
    }
}
