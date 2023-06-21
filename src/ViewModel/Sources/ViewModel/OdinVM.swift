//
//  MatiereVM.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import Modele

// ViewModel wrappant la classe Odin contenue dans le modèle
public class OdinVM : ObservableObject, Hashable {
    
    @Published  var model: Odin {
        willSet(newValue) {
            if !self.blocs.map({$0.model}).compare(to: newValue.blocs){
                self.blocs.forEach { $0.unsubscribe(with: self) }
            }
        }
        didSet {
           /*if !self.model.ues.compare(to: self.ues.map({$0.model})){
                self.ues = self.model.ues.map({UEVM(withUE: $0)})
            }*/
            if !self.model.blocs.compare(to: self.blocs.map({$0.model})){
                self.blocs = self.model.blocs.map({BlocVM(withBloc:$0)})
                self.blocs.forEach { blocvm in
                    blocvm.subscribe(with: self, and: onNotifyChanged)
                }
            }
        }
    }
    
    // Propriété du modèle wrappées
    @Published public var blocs: [BlocVM] = [] {
        didSet {
            let someBlocsModel = self.blocs.map({$0.model})
            if !self.model.blocs.compare(to: someBlocsModel){
                self.model.blocs = self.blocs.map({$0.model})
            }
        }
    }
    
    public var ues: [UEVM] { getUEs() } // propriété calculée car, pour moi, ce sont les blocs qui gèrent les UEs

    public init(withOdin odin: Odin){
        self.model = odin
        odin.blocs.forEach { bloc in blocs.append(BlocVM(withBloc: bloc))}
        self.blocs.forEach { blocvm in
            blocvm.subscribe(with: self, and: onNotifyChanged)
        }
        // odin.ues.forEach { ue in ues.append(UEVM(withUE: ue))}
    }
    
    public convenience init(){
            self.init(blocs:[])
    }
        
    // Init avec les collections de VM
    public init(blocs : [BlocVM]) {
        self.model = Odin()
        self.blocs = blocs
        self.blocs.forEach { blocvm in
            blocvm.subscribe(with: self, and: onNotifyChanged)
        }
        self.model.blocs = self.blocs.map({$0.model})
    }
    
    // Récupère toutes les ues de chaque bloc
    public func getUEs()-> [UEVM] {
        var res : [UEVM] = []
        self.blocs.forEach { bloc in bloc.ues.forEach { ue in res.append(ue) } }
        return res
    }
    
    public func loadData() async {
        let res : [Bloc]?
        do {
            try res = await DataStore().load()
                if let res = res {
                    if res.isEmpty {
                        self.model = Stub.Odin
                    }
                    else {
                        self.model.blocs = res
                    }
                }
                else {
                    self.model = Stub.Odin
                }
        } catch {
            self.model = Stub.Odin
        }
    }
    
    public func saveData() async {
        do {
            try await DataStore().save(blocs: self.model.blocs)
        }
        catch {
            
        }
    }
    
    func onNotifyChanged(source:BlocVM){
        if let index = self.model.blocs.firstIndex(of: source.model){
            self.model.blocs[index] = source.model
        }
        self.objectWillChange.send()
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(model.id)
    }
    
    public static func == (lhs: OdinVM, rhs: OdinVM) -> Bool {
        lhs.model.id == rhs.model.id
    }
}
