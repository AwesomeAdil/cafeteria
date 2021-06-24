//
//  helpApp.swift
//  help
//
//  Created by adil bhatti on 6/11/21.
//

import SwiftUI
import Firebase
@main
struct helpApp: App {
    
    init(){

        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

