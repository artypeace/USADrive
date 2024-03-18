//
//  MainScreen.swift
//  USADrive
//
//  Created by AV on 3/18/24.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
           NavigationView {
               GeometryReader { geometry in
                   ZStack {
                       AnimatedBackgroundView() // Ваш анимированный фон
                       
                       LinearGradient(
                           gradient: Gradient(stops: [
                               .init(color: .clear, location: 0),
                               .init(color: Color(.systemBackground), location: 0.2)
                           ]),
                           startPoint: .top,
                           endPoint: .bottom
                       )
                       .edgesIgnoringSafeArea(.all) // Расширить градиент до краев экрана
                   }
                   .frame(width: geometry.size.width, height: geometry.size.height)
                   .navigationBarTitle("USA Drive", displayMode: .large) // Заголовок навигационной панели
               }
           }
       }}

#Preview {
    MainScreen()
}
