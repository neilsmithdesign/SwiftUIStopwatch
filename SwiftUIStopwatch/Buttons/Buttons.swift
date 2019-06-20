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
    private var isPaused: Bool {
        return isActive && !isRunning
    }
    
    
    // MARK: Body
    var body: some View {
        Button(action: onTap) {
            CircleView(text: text, textColor: textColor).foregroundColor(self.color)
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
    
    
    // MARK: Text
    private var text: String {
        isPaused ? "Reset" : "Lap"
    }
    private var textColor: Color {
        isActive ? Color.white : Color.white.opacity(0.5)
    }
    
}


struct StartStopButton: View {
    
    
    // MARK: Binding
    @Binding var isActive: Bool
    @Binding var isRunning: Bool
    
    
    // MARK: Body
    var body: some View {
        Button(action: action) {
            CircleView(
                text: self.text,
                textColor: self.textColor
                )
                .foregroundColor(self.color.opacity(0.5))
        }
    }
    
    
    // MARK: Action
    var action: (() -> Void)
    
    
    // MARK: Color
    private var color: Color {
        isRunning ? .red : .green
    }
    
    
    // MARK: Text
    private var text: String {
        isRunning ? "Stop" : "Start"
    }
    private var textColor: Color {
        isRunning ? .red : .green
    }
    
}


struct CircleView: View {
    
    var text: String
    var textColor: Color
    
    var body: some View {
        ZStack {
            Circle().frame(width: 80, height: 80, alignment: .center)
            Text(text).color(self.textColor)
        }
    }
    
}
