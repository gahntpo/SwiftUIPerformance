//
//  View+Test.swift
//  SwiftUIPerformanceProject
//
//  Created by Karin Prater on 21.02.24.
//

import SwiftUI


extension View {
    
    func testListRowBackground() -> some View {
        #if DEBUG
        self.listRowBackground(Color.random())
        #else
        self
        #endif
    }
    
    func testBackground() -> some View {
        #if DEBUG
        self.background(Color.random())
        #else
        self
        #endif
    }
    
    func testAnimatedBackground() -> some View {
        #if DEBUG
        self.modifier(AnimatedBackground())
        #else
        self
        #endif
    }
}

struct AnimatedBackground: ViewModifier {
    
    @State private var isVisible: Bool = false
    let linewidth: CGFloat = 5
    
    func body(content: Content) -> some View {
        content
            .overlay(content: {
                
                Rectangle()
                    .trim(from: isVisible ? 1 : 0, to: 1)
                    .stroke(Color.red, lineWidth: linewidth)
                    .padding(linewidth)
                 
                Rectangle()
                    .trim(from: isVisible ? 1 : 0, to: 1)
                    .stroke(Color.blue, lineWidth: linewidth)
                    .rotationEffect(.degrees(180))
            })
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)) {
                    isVisible = true
                }
            })
    }
}
