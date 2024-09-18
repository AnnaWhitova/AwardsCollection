//
//  CircleView.swift
//  AwardsCollection
//
//  Created by Анна Белова on 18.09.2024.
//

import SwiftUI

struct CircleView: View {
   @Binding var isRotating: Bool
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let minimumSize = min(width, height)
            let middle = minimumSize / 2
            let numberOfTurns = 5
            let points = 250
            
            Path { path in
                path.addArc(
                    center: CGPoint(x: width/2, y: height/2),
                    radius: middle,
                    startAngle: .degrees(0),
                    endAngle: .degrees(360),
                    clockwise: false
                )
            }
            .fill(
                RadialGradient(
                    colors: [.blue, .red],
                    center: .center,
                    startRadius: minimumSize * 0.2,
                    endRadius: minimumSize * 0.5
                )
            )
            
            Path { path in
                for i in 0..<points {
                    let angle = CGFloat(i) * (2 * .pi / CGFloat(points)) * CGFloat(numberOfTurns)
                    let radius = minimumSize/2 * CGFloat(i) / CGFloat(points)
                    let x = radius * cos(angle)
                    let y = radius * sin(angle)
                    if i == 0 {
                        path.move(to: CGPoint(x: x + width/2, y: y + height/2))
                    } else {
                        path.addLine(to: CGPoint(x: x + width/2, y: y + height/2))
                    }
                }
            }
            .stroke(Color.white, lineWidth: 2)
            .rotationEffect(.degrees(isRotating ? 360 : 0)) 
            .animation(.easeInOut(duration: 6.0), value: isRotating)
           
        }
        
    }
}

#Preview {
    CircleView(isRotating: .constant(true))
        .frame(width: 200, height: 200)
}
