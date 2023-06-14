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
            MainPage(odin: odin)
        }
    }
}
