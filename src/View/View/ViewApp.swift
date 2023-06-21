//
//  ViewApp.swift
//  View
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import ViewModel
import Modele

@main
struct ViewApp: App {
    
    @StateObject
    var odin : OdinVM = OdinVM()
    
    var body: some Scene {
        WindowGroup {
            HomeView(odin: odin) {
                Task {
                    do {
                        try await odin.saveData()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }.accentColor(Color(ColorAssets.PRIMARYCOLOR)).backgroundStyle(.black)
                .task {
                    do {
                        try await odin.loadData()
                    } catch {
                        fatalError(error.localizedDescription)
                        
                    }
                }
        }
    }
}
