//
//  MatiereVM.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import Modele

class BlocVM : ObservableObject, Identifiable, Equatable {
    
    @Published  var model: Bloc {
        didSet {
            if self.name != self.model.name {
                self.name = self.model.name;
            }
            if !self.model.ues.compare(to: self.ues.map({$0.model})){
                self.ues = self.model.ues.map({UEVM(withUE: $0)})
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
    
    var moyenne: Float {
        get {
            model.moyenne
        }
    }

    @Published public var ues: [UEVM] = [] {
        didSet {
            let someUEsModel = self.ues.map({$0.model})
            if !self.model.ues.compare(to: someUEsModel){
                self.model.ues = self.ues.map({$0.model})
            }
        }
    }
    
    init(withBloc bloc: Bloc){
        self.model = bloc
        bloc.ues.forEach { ue in ues.append(UEVM(withUE: ue))}
    }
    
    static func == (lhs: BlocVM, rhs: BlocVM) -> Bool {
        lhs.id == rhs.id
    }
}
