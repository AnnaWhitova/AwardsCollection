//
//  AwardsCollectionApp.swift
//  AwardsCollection
//
//  Created by Анна Белова on 18.09.2024.
//

import SwiftUI

struct CartRacingView: View {
    @State private var start = false
    
    var body: some View {
        HStack {
            VStack(spacing: 10) {
                CartView(
                    start: start,
                    title: "Default",
                    color: .red,
                    animation: .default.speed(0.5)
                )
                CartView(
                    start: start,
                    title: "EaseOut",
                    color: .green,
                    animation: .easeOut(duration: 0.7)
                )
                CartView(
                    start: start,
                    title: "EaseIn",
                    color: .yellow,
                    animation: .easeIn(duration: 0.7)
                )
                CartView(
                    start: start,
                    title: "EaseInOut",
                    color: .blue,
                    animation: .easeInOut(duration: 0.7)
                )
                CartView(
                    start: start,
                    title: "Int-ing Spring",
                    color: .brown,
                    animation: .interpolatingSpring(
                        mass: 1,
                        stiffness: 100,
                        damping: 10,
                        initialVelocity: 0
                    )
                )
                CartView(
                    start: start,
                    title: "Spring",
                    color: .orange,
                    animation: .spring(
                        response: 0.55,
                        dampingFraction: 0.45,
                        blendDuration: 0
                    )
                    .repeatCount(3)
                )

            }
            Spacer()
        }
        .onTapGesture {
            start.toggle()
        }
    }
}

struct CartRacingView_Previews: PreviewProvider {
    static var previews: some View {
        CartRacingView()
    }
}

struct CartView: View {
    let start: Bool
    let title: String
    let color: Color
    let animation: Animation
    
    var body: some View {
        VStack {
            Image(systemName: "cart.fill")
                .font(.title)
                .foregroundColor(color)
                .offset(x: start ? UIScreen.main.bounds.width - 80 : 0)
                .animation(animation, value: start)
            Text(title)
        }
    }
}
