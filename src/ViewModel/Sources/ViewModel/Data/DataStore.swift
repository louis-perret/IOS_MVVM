//
//  File.swift
//  
//
//  Created by etudiant on 14/06/2023.
//

import Foundation
import SwiftUI
import Modele

// DataStore pour la persistance en JSON
@MainActor
class DataStore {

    // Renvoie le lien vers le dossier de persistance
    private static func fileURL() throws -> URL {
        // récupère tous les chemins disponibles
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

            // on utilise le premier
            return paths[0]
    }

    // Charge les données
    func load() async throws -> [Bloc] {
        if let savedPerson = UserDefaults.standard.object(forKey: "SavedOdin") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode([Bloc].self, from: savedPerson) {
                return loadedPerson
            }
        }
        return []
    }
    
    // Sauvegarde les données
    func save(blocs: [Bloc]) async throws {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(blocs) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "SavedOdin")
        }
    }
}
