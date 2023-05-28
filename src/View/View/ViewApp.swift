//
//  ViewApp.swift
//  View
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import Modele

@main
struct ViewApp: App {
    
    @StateObject
    var odin : OdinVM = OdinVM(withOdin: Stub.Odin)
    
    var body: some Scene {
        WindowGroup {
            MainPage(odin: odin)
        }
    }
}
