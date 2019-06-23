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
    @Binding var mode: Stopwatch.Mode
    private var isActive: Bool {
        return mode != .inactive
    }
    
    
    // MARK: Body
    var body: some View {
        Button(action: onTap) {
            CircleView(
                text: text,
                textColor: textColor,
                foregroundColor: color,
                opacity: 1
            )
        }.disabled(!isActive)
    }
    
    
    // MARK: Action
    var action: (() -> Void)
    private func onTap() {
        guard isActive else { return }
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
        mode == .paused ? "Reset" : "Lap"
    }
    private var textColor: Color {
        isActive ? Color.white : Color.white.opacity(0.5)
    }
    
}


struct StartStopButton: View {
    
    
    // MARK: Binding
    @Binding var mode: Stopwatch.Mode
    
    
    // MARK: Body
    var body: some View {
        Button(action: action) {
            CircleView(
                text: text,
                textColor: textColor,
                foregroundColor: color,
                opacity: 0.5
            )
        }
    }
    
    
    // MARK: Action
    var action: (() -> Void)
    
    
    // MARK: Color
    private var color: Color {
        mode == .running ? .red : .green
    }
    
    
    // MARK: Text
    private var text: String {
        mode == .running ? "Stop" : "Start"
    }
    private var textColor: Color {
        mode == .running ? .red : .green
    }
    
}


struct CircleView: View {
    
    var text: String
    var textColor: Color
    var foregroundColor: Color
    var opacity: Double
    private var fillColor: Color {
        foregroundColor.opacity(opacity)
    }
    
    var body: some View {
        ZStack {
            Circle().fill(fillColor).frame(width: 80, height: 80, alignment: .center)
            Text(text).color(self.textColor)
        }
    }
    
}
