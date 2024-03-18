//
//  USADriveApp.swift
//  USADrive
//
//  Created by AV on 2/17/24.
//

import SwiftUI

@main
struct USADriveApp: App {
    
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            switch appState.rootScreen {
            case .home:
                Home(appState: appState)
            case .mainScreen:
                MainScreen()
            }
        }
    }
}
