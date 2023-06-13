//
//  MatiereVM.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import Modele

public class MatiereVM : ObservableObject, Identifiable, Equatable {

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
            
            notifyPropertyChanged()
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
    
    @Published
    public var moyenne:Float = 0 {
        didSet {
            if self.model.moyenne != self.moyenne {
                self.model.moyenne = self.moyenne;
            }
        }
    }
    
    private var copy : MatiereVM {
        MatiereVM(withMatiere: self.model)
    }
    
    @Published public var isEdited = false
    public var editedCopy : MatiereVM?
    
    var ue: UEVM?
    
    private func notifyPropertyChanged(){
        ue?.update(from: self)
    }
    
    public convenience init(withEdition isEditing: Bool = false) {
        self.init(withMatiere: Matiere(name: "Nouvelle matière", coef: 0, moyenne: 0), andEdition: isEditing)
    }
    
    public init(withMatiere matiere: Matiere, andEdition isEditing: Bool = false){
        self.model = matiere
        self.name = matiere.name
        self.coef = matiere.coef
        self.moyenne = matiere.moyenne
        self.isEdited = isEditing
    }
    
    public func onEditing(){
        editedCopy = copy
        isEdited = true
    }
    
    public func onEdited(isCancelled: Bool = false){
        if(!isCancelled){
            if let editedCopy = editedCopy {
                self.model = editedCopy.model
            }
        }
        isEdited = false
        editedCopy = nil
    }
    
    public static func == (lhs: MatiereVM, rhs: MatiereVM) -> Bool {
        lhs.id == rhs.id && lhs.model.name == rhs.model.name && lhs.model.coef == rhs.model.coef && lhs.model.moyenne == rhs.model.moyenne
    }
}
