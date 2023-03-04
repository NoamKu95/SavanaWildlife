//
//  MotionAnimationView.swift
//  SavanaWildlife
//
//  Created by Noam Kurtzer on 04/03/2023.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomCirclesNumber = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    func randomCoordinates(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    func randomcScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCirclesNumber, id: \.self) { circle in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect( isAnimating ? randomcScale() : 1)
                        .position(x: randomCoordinates(max: geometry.size.width / 2),
                                  y: randomCoordinates(max: geometry.size.height / 2))
                        .animation(
                            .interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                }
            }
            .drawingGroup()
        }
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
