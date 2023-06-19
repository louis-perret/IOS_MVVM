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
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("odin.data")
    }

    func load() async throws -> [Bloc] {
        let task = Task<[Bloc], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            return try JSONDecoder().decode([Bloc].self, from: data)
        }
        return []
    }
    
    func save(blocs: [Bloc]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(blocs)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        try await task.value
    }
}
