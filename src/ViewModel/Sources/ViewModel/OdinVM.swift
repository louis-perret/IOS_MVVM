//
//  MatiereVM.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import Modele

class OdinVM : ObservableObject {
    @Published  var model: Odin {
        didSet {
           /*if !self.model.ues.compare(to: self.ues.map({$0.model})){
                self.ues = self.model.ues.map({UEVM(withUE: $0)})
            }*/
            if !self.model.blocs.compare(to: self.blocs.map({$0.model})){
                self.blocs = self.model.blocs.map({BlocVM(withBloc:$0)})
            }
        }
    }
    
    @Published public var blocs: [BlocVM] = [] {
        didSet {
            let someBlocsModel = self.blocs.map({$0.model})
            if !self.model.blocs.compare(to: someBlocsModel){
                self.model.blocs = self.blocs.map({$0.model})
            }
        }
    }
    
    public var ues: [UEVM] { getUEs() }
    
    public init(withOdin odin: Odin){
        self.model = odin
        odin.blocs.forEach { bloc in blocs.append(BlocVM(withBloc: bloc))}
        // odin.ues.forEach { ue in ues.append(UEVM(withUE: ue))}
    }
    
    public init(blocs : [BlocVM], ues : [UEVM]) {
        self.model = Odin()
        self.blocs = blocs
        
        self.model.blocs = self.blocs.map({$0.model})
    }
    
    public func getUEs()-> [UEVM] {
        var res : [UEVM] = []
        self.blocs.forEach { bloc in bloc.ues.forEach { ue in res.append(ue) } }
        return res
    }

}
