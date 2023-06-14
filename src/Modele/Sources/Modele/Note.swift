//
//  File.swift
//  
//
//  Created by etudiant on 26/05/2023.
//

import Foundation

public protocol Note : Codable {
    var name: String { get set }
    var coef: Int { get set }
    var moyenne: Float { get set }
}
