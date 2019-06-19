//
//  Buttons.swift
//  SwiftUIStopwatch
//
//  Created by Neil Smith on 19/06/2019.
//  Copyright © 2019 Neil Smith. All rights reserved.
//

import SwiftUI

struct LapResetButton: View {
    
    
    // MARK: Binding
    @Binding var isActive: Bool
    @Binding var isRunning: Bool
    
    
    // MARK: Body
    var body: some View {
        Button(action: onTap) {
            CircleView().foregroundColor(self.color)
            }.disabled(!isActive)
    }
    
    
    // MARK: Action
    var action: (() -> Void)
    private func onTap() {
        guard self.isActive else { return }
        self.action()
    }
    
    
    // MARK: Color
    private var color: Color {
        isActive ? activeColor : inactiveColor
    }
    private let activeColor: Color = .gray
    private let inactiveColor: Color = Color.gray.opacity(0.2)
    
}


struct StartStopButton: View {
    
    
    // MARK: Binding
    @Binding var isActive: Bool
    @Binding var isRunning: Bool
    
    
    // MARK: Body
    var body: some View {
        Button(action: action) {
            CircleView().foregroundColor(self.color)
        }
    }
    
    
    // MARK: Action
    var action: (() -> Void)
    
    
    // MARK: Color
    private var color: Color {
        isRunning ? .red : .green
    }
    
}


struct CircleView: View {
    
    var body: some View {
        Circle().frame(width: 96, height: 96, alignment: .center)
    }
    
}
