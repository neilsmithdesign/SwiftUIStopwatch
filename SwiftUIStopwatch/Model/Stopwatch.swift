//
//  Stopwatch.swift
//  SwiftUIStopwatch
//
//  Created by Neil Smith on 19/06/2019.
//  Copyright © 2019 Neil Smith. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class Stopwatch: BindableObject {
    
    // MARK: Binding
    var didChange = PassthroughSubject<Void, Never>()
    
    private func notify() {
        didChange.send(())
    }
    
    
    // MARK: State
    var isActive: Bool = false
    
    var isRunning: Bool = false
    
    private var mode: Mode {
        if isActive {
            return isRunning ? .active : .paused
        } else {
            return .inactive
        }
    }


    // MARK: Data
    private var lapTimes: [Date] = []
    private var elapsedTime: TimeInterval = 0
    
}


// MARK: - Interface
extension Stopwatch {
    
    func startOrStop() {
        switch mode {
        case .inactive: start()
        case .active: pause()
        case .paused: start()
        }
    }
    
    func recordLapTimeOrReset() {
        switch mode {
        case .inactive: return
        case .active: recordLapTime()
        case .paused: reset()
        }
    }
    
}


// MARK: - Helpers
extension Stopwatch {
    
    private func start() {
        isRunning = true
        isActive = true
        notify()
    }
    
    private func pause() {
        isRunning = false
        isActive = true
        notify()
    }
    
    private func reset() {
        isRunning = false
        isActive = false
        lapTimes.removeAll()
        notify()
    }
    
    private func recordLapTime() {
        lapTimes.append(Date())
        notify()
    }
    
}


// MARK: - Types
extension Stopwatch {
    
    enum Mode: String {
        case inactive
        case active
        case paused
    }
    
}
