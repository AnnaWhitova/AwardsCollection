//
//  AwardsCollectionApp.swift
//  AwardsCollection
//
//  Created by Анна Белова on 18.09.2024.
//

import SwiftUI

struct MainView: View  {
    @State private var awardIsShowing = false
    @State private var isRotating = false
    
    var body: some View {
        VStack {
            Button(action: buttonAction) {
                Text(awardIsShowing ? "Hide Award" : "Show Award")
                Spacer()
                Image(systemName: "chevron.up.square")
                    .rotationEffect(.degrees(awardIsShowing ? 0 : 180))
                    .scaleEffect(awardIsShowing ? 2 : 1)
            }
            
            Spacer()
            
            if awardIsShowing {
                CircleView(isRotating: $isRotating)
                    .frame(width: 250, height: 250)
                  
            }
            
            Spacer()
        }
        .font(.headline)
        .padding()
    }
    
    private func buttonAction() {
        withAnimation {
            awardIsShowing.toggle()
            isRotating = awardIsShowing
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
