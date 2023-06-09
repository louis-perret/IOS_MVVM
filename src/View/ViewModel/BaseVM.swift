//
//  BaseVM.swift
//  View
//
//  Created by etudiant on 02/06/2023.
//

import Foundation

public class BaseVM: ObservableObject {
    var updateFunc: [ (BaseVM) -> ()] = []
}
