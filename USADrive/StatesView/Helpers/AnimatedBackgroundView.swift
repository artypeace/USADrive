//
//  AnimatedBackgroundView.swift
//  USADrive
//
//  Created by AV on 3/11/24.
//

import SwiftUI


struct AnimatedBackgroundView: View {
    @State private var animation = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Фоновое изображение
                firstImage(geometry: geometry)
                // Дополнительные изображения для создания эффекта анимации
                image(geometry: geometry)
                image(geometry: geometry)
                image(geometry: geometry).opacity(0.5)
                // Добавление блюра для создания эффекта глубины
                VisualEffect(effect: UIBlurEffect(style: .systemUltraThinMaterial))
                VisualEffect(effect: UIBlurEffect(style: .light))
                VisualEffect(effect: UIBlurEffect(style: .light))
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                withAnimation(Animation.linear(duration: 100).repeatForever(autoreverses: false)) {
                    animation.toggle()
                }
            }
        }
    }

    func image(geometry: GeometryProxy) -> some View {
        Image("flower")
            .resizable()
            .frame(
                width: randomFrame(geometry.size.width),
                height: randomFrame(geometry.size.width)
            )
            .scaleEffect(randomCGFloat(in: 1...2.5))
            .rotationEffect(.degrees(randomDouble(in: -360...360)), anchor: .center)
            .offset(x: randomCGFloat(in: -300...300), y: randomCGFloat(in: -300...300))
            .blendMode(.lighten)
            .saturation(randomDouble(in: 0.4...1.4))
            .contrast(2)
    }

    func firstImage(geometry: GeometryProxy) -> some View {
        Image("flower")
            .resizable()
            .brightness(-0.5)
            .rotationEffect(.degrees(randomDouble(in: -360...360)), anchor: .center)
            .frame(width: geometry.size.height * 2, height: geometry.size.height * 2)
    }

    func randomFrame(_ base: CGFloat) -> CGFloat {
        let randomNumber = animation ? CGFloat.random(in: -100...300) : CGFloat.random(in: -100...300)
        return base + randomNumber
    }

    func randomCGFloat(in range: ClosedRange<CGFloat>) -> CGFloat {
        let randomNumber = animation ? CGFloat.random(in: range) : CGFloat.random(in: range)
        return randomNumber
    }

    func randomDouble(in range: ClosedRange<Double>) -> Double {
        let randomNumber = animation ? Double.random(in: range) : Double.random(in: range)
        return randomNumber
    }
}

struct VisualEffect: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: effect)
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = effect
    }
}

struct AnimatedBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedBackgroundView()
    }
}
