//
//  MatiereVM.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import Modele

// ViewModel wrappant la classe Matiere contenue dans le modèle
public class MatiereVM : ObservableObject, Identifiable, Equatable {

    // Modèle wrappé
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
            
            // notifyPropertyChanged()
            onNotify()
        }
    }
    
    // Propriétés du modèle wrappées par la VMP
    
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
    
    // Copie pour l'édition
    private var copy : MatiereVM {
        MatiereVM(withMatiere: self.model)
    }
    @Published public var isEdited = false // True si l'utilisateur est entrain de modifiée la Matière
    public var editedCopy : MatiereVM? // copie exposée à l'utilisateur
    
    // var ue: UEVM? // ancienne méthode pour gérer la notification (quick & dirty)
     
    private var updateFuncs: [AnyHashable:(MatiereVM) -> ()] = [:] // collection d'observateurs
        
    // Ajoute un observateur
    public func subscribe(with obj: AnyHashable, and function:@escaping (MatiereVM) -> ()) {
        updateFuncs[obj] = function
    }
     
    // Supprime un observateur
    public func unsubscribe(with obj: AnyHashable) {
        updateFuncs.removeValue(forKey: obj)
    }
        
    // Notifie chaque observateur
    private func onNotify(){
        for f in updateFuncs.values {
            f(self)
        }
    }
    
    // Ancienne méthode pour notifier le parent
    /*private func notifyPropertyChanged(){
        ue?.update(from: self)
    }*/
    
    // Init
    public convenience init(withEdition isEditing: Bool = false) {
        self.init(withMatiere: Matiere(name: "Nouvelle matière", coef: 1, moyenne: 10), andEdition: isEditing)
    }
    
    // Init
    public init(withMatiere matiere: Matiere, andEdition isEditing: Bool = false){
        self.model = matiere
        self.name = matiere.name
        self.coef = matiere.coef
        self.moyenne = matiere.moyenne
        self.isEdited = isEditing
    }
    
    // Set la propriété isEdited à true
    public func onEditing(){
        editedCopy = copy
        isEdited = true
    }
    
    // Applique les changements de la copie vers l'originale
    public func onEdited(isCancelled: Bool = false){
        if(!isCancelled){
            if let editedCopy = editedCopy {
                self.model = editedCopy.model
            }
        }
        isEdited = false
        editedCopy = nil
    }
    
    // Equals
    public static func == (lhs: MatiereVM, rhs: MatiereVM) -> Bool {
        lhs.id == rhs.id && lhs.model.name == rhs.model.name && lhs.model.coef == rhs.model.coef && lhs.model.moyenne == rhs.model.moyenne
    }
}
