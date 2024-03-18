//
//  AppState.swift
//  USADrive
//
//  Created by AV on 3/18/24.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var rootScreen: RootScreen = .home
}

enum RootScreen {
    case home
    case mainScreen
}
