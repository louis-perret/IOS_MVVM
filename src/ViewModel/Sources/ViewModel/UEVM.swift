//
//  UEVM.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import Modele

public class UEVM : ObservableObject, Identifiable, Equatable, Hashable {
    
    public init(withUE ue: UE, andEdition isEditing: Bool = false, andBloc bloc : BlocVM? = nil){
        self.model = ue
        self.name = ue.name
        self.coef = ue.coef
        self.isEditing = isEditing
        self.matieres = ue.matieres.map({MatiereVM(withMatiere: $0, andEdition: self.isEditing)})
        self.matieres.forEach { mvm in
            mvm.subscribe(with: self, and: onNotifyChanged)
        }
       // self.bloc = bloc
        // ue.matieres.forEach { m in matieres.append(MatiereVM(withMatiere: m)) }
    }
    @Published var model: UE {
        willSet(newValue) {
            if !self.matieres.map({$0.model}).compare(to: newValue.matieres){
                self.matieres.forEach { $0.unsubscribe(with: self) }
            }
        }
        didSet {
            if self.name != self.model.name {
                self.name = self.model.name
            }
            if self.coef != self.model.coef {
                self.coef = self.model.coef
            }
            let newMatieresVM = self.model.matieres.map({MatiereVM(withMatiere: $0, andEdition: self.isEditing)})
            if !self.matieres.compare(to: newMatieresVM){
                self.matieres = newMatieresVM
                self.matieres.forEach { mvm in
                    mvm.subscribe(with: self, and: onNotifyChanged)
                }
            }
            
            onNotify()
           // notifyPropertyChanged()
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
        UEVM(withUE: self.model, andEdition: self.isEditing)
    }
    
    @Published public var isEditing = false
    public var editedCopy : UEVM?
    
    // var bloc: BlocVM?
    
    private var updateFuncs: [AnyHashable:(UEVM) -> ()] = [:]
        
    public func subscribe(with obj: AnyHashable, and function:@escaping (UEVM) -> ()) {
        updateFuncs[obj] = function
    }
        
    public func unsubscribe(with obj: AnyHashable) {
        updateFuncs.removeValue(forKey: obj)
    }
        
    private func onNotify(){
        for f in updateFuncs.values {
            f(self)
        }
    }
    
    /*
    private func notifyPropertyChanged(){
        bloc?.update(from: self)
    }*/
    
    public func onEditing(){
        isEditing = true
        editedCopy = copy
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
    
    public static func == (lhs: UEVM, rhs: UEVM) -> Bool {
        lhs.id == rhs.id && lhs.model.name == rhs.model.name && lhs.model.coef == rhs.model.coef && lhs.model.moyenne == rhs.model.moyenne && lhs.matieres.compare(to: rhs.matieres)
    }
    
    /*func update(from mvm: MatiereVM){
        let index = model.matieres.firstIndex(of: mvm.model)
        model.matieres[index!] = mvm.model
        self.objectWillChange.send()
    }*/
    
    public func addMatiere() {
        var newMatiere = MatiereVM(withEdition: true)
        newMatiere.subscribe(with: self, and: onNotifyChanged)
        self.matieres.append(newMatiere)
    }
    
    public func onDeleted(_ matiere:MatiereVM, isCancelled cancel: Bool = false) {
        if !cancel {
            if self.matieres.contains(matiere) {
                self.matieres.filter { $0 == matiere }
                    .forEach { $0.unsubscribe(with: self) }
                self.matieres.removeAll(where: {$0 == matiere})
            }
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    func onNotifyChanged(source:MatiereVM){
        if let index = self.model.matieres.firstIndex(of: source.model){
            self.model.matieres[index] = source.model
        }
        self.objectWillChange.send()
    }
}
