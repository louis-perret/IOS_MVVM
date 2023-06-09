//
//  MatiereVM.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import Modele

class OdinVM : ObservableObject {
    var original: Odin
    
    @Published public var blocs: [BlocVM] = []
    @Published public var ues: [UEVM] = []
    
    init(withOdin odin: Odin){
        self.original = odin
        odin.blocs.forEach { bloc in blocs.append(BlocVM(withBloc: bloc, andId:UUID()))}
        odin.ues.forEach { ue in ues.append(UEVM(withUE: ue))}
    }
}
