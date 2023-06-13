//
//  MatiereVM.swift
//  View
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import Modele

public class BlocVM : ObservableObject, Identifiable, Equatable, Hashable {
    
    @Published  var model: Bloc {
        didSet {
            if self.name != self.model.name {
                self.name = self.model.name;
            }
            if !self.model.ues.compare(to: self.ues.map({$0.model})){
                self.ues = self.model.ues.map({UEVM(withUE: $0, andBloc: self)})
                self.ues.forEach { euvm in
                    euvm.subscribe(with: self, and: onNotifyChanged)
                }
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
    
    public var moyenne:Float { model.moyenne }

    @Published public var ues: [UEVM] = [] {
        didSet {
            let someUEsModel = self.ues.map({$0.model})
            if !self.model.ues.compare(to: someUEsModel){
                self.model.ues = self.ues.map({$0.model})
            }
        }
    }
    
    public init(withBloc bloc: Bloc){
        self.model = bloc
        bloc.ues.forEach { ue in ues.append(UEVM(withUE: ue, andBloc: self))}
        self.ues.forEach { euvm in
            euvm.subscribe(with: self, and: onNotifyChanged)
        }
    }
    
    func update(from evm: UEVM){
        let index = model.ues.firstIndex(of: evm.model)
        model.ues[index!] = evm.model
        self.objectWillChange.send()
    }
    
    public static func == (lhs: BlocVM, rhs: BlocVM) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    func onNotifyChanged(source:UEVM){
        if let index = self.model.ues.firstIndex(of: source.model){
            self.model.ues[index] = source.model
        }
        self.objectWillChange.send()
    }
}
