//
//  MainScreen.swift
//  USADrive
//
//  Created by AV on 3/18/24.
//

import SwiftUI
import Neumorphic


struct MainScreen: View {
    
    @Environment(\.colorScheme) var colorScheme

    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    AnimatedBackgroundView() // Ваш анимированный фон
                    
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .clear, location: 0),
                            .init(color: Color.Neumorphic.main, location: 0.2)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .edgesIgnoringSafeArea(.all)// Расширить градиент до краев экрана
                    Button("Tap Me") {
                                            // Действие при нажатии на кнопку
                                            print("Button tapped!")
                                        }.softButtonStyle(RoundedRectangle(cornerRadius: 8))

                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .navigationBarTitle("USA Drive", displayMode: .large) // Заголовок навигационной панели
                .navigationBarItems(trailing:
                    Button(action: {
                        // Действие при нажатии на кнопку
                    }) {
                        Image("CA")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 38)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
//                            .shadow(color: .gray.opacity(0.3), radius: 3, x: 0, y: 2)
//                            .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 5, y: 5)
//                            .shadow(color: colorScheme == .dark ? Color.black.opacity(0.7) : Color.white.opacity(0.7), radius: 5, x: -5, y: -5)
                    }
                    .padding(.trailing, 10)
                    .padding(.top, 44)
                                    
                )
            }
        }
    }
}

#Preview {
    MainScreen()
}
