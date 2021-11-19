//
//  MainView.swift
//  AwardsCollectionApp
//
//  Created by Александр on 14.11.21.
//

import SwiftUI

struct MainView: View {
    @State private var showAward = false
    var body: some View {
        VStack {
            Button(action: buttonActon) {
                HStack {
                    Text(showAward ? "Hide Award" : "Show Award")
                    Spacer()
                    Image(systemName: "chevron.up.square")
                        .scaleEffect(showAward ? 2 : 1)
                        .rotationEffect(.degrees(showAward ? 0 : 180))
                    //                        .animation(.default)
                }
            }
            Spacer()
            if showAward {
                GradientRectangles()
                    .frame(width: 250, height: 250)
                    .transition(.transition)
            }
            //                    .offset(x: showAward ? 0 : -UIScreen.main.bounds.width)
            //                    .animation(
            //                        .spring().delay(0.3)
            
            //                        .spring(
            //                            response: 0.55,
            //                            dampingFraction: 0.45,
            //                            blendDuration: 0
            //                        )
            
            //                        .interpolatingSpring(
            //                            mass: 1.0,
            //                            // жесткость
            //                            stiffness: 100,
            //                            // затухание
            //                            damping: 10,
            //                            // ускорение
            //                            initialVelocity: 0
            //                        )
            //                    )
            Spacer()
        }
        .font(.headline)
        .padding()
    }
    
    private func buttonActon() {
        withAnimation {
            showAward.toggle()
        }
    }
}

extension AnyTransition {
    static var transition: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .scale)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
