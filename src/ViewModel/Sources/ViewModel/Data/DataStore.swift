//
//  File.swift
//  
//
//  Created by etudiant on 14/06/2023.
//

import Foundation
import SwiftUI
import Modele

@MainActor
class DataStore {

    private static func fileURL() throws -> URL {
        // find all possible documents directories for this user
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

            // just send back the first one, which ought to be the only one
            return paths[0]
    }

    func load() async throws -> [Bloc] {
        if let savedPerson = UserDefaults.standard.object(forKey: "SavedOdin") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode([Bloc].self, from: savedPerson) {
                return loadedPerson
            }
        }
        return []
        /*let task = Task<[Bloc], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            return try JSONDecoder().decode([Bloc].self, from: data)
        }
        return []*/
    }
    
    func save(blocs: [Bloc]) async throws {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(blocs) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "SavedOdin")
        }
        /*let task = Task {
            do {
                let  data = try JSONEncoder().encode(blocs)
                let outfile = try Self.fileURL()
                print(outfile)
                try data.write(to: outfile)
            }
            catch {
                print(error)
            }
        }
        try await task.value*/
    }
}
