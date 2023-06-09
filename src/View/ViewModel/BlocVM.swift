//
//  MatiereVM.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import Modele

class BlocVM : ObservableObject, Identifiable {
    public let id:UUID
    var original: Bloc
    
    @Published public var ues: [UEVM] = []
    var moyenne: Float {
        get {
            original.moyenne
        }
    }

    var nom: String {
        get {
            original.nom
        }
    }
    
    init(withBloc bloc: Bloc, andId id: UUID){
        self.original = bloc
        self.id = id
        bloc.listeUE.forEach { ue in ues.append(UEVM(withUE: ue))}
    }
}
