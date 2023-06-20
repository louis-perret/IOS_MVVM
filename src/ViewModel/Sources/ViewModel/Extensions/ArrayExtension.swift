//
//  ArrayExtension.swift
//  View
//
//  Created by etudiant on 09/06/2023.
//

import Foundation

// Méthodes d'extension pour les tableaux
extension Array where Element: Equatable {
    
    // Renvoie True si deux tableaux ont le même nombre de données et si ces données sont similaires
    func compare(to other: [Element]) -> Bool {
        self.count == other.count && self.allSatisfy({ elt in
            other.contains { otherElt in
                otherElt == elt
            }
        })
    }
}
