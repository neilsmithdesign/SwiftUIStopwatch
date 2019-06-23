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

struct LapTime: Identifiable {
    var id: Int
    let value: TimeInterval
}


final class Stopwatch: BindableObject {
    
    
    // MARK: Binding
    var didChange = PassthroughSubject<Void, Never>()
    
    private func notify() {
        didChange.send(())
    }
    
    
    // MARK: State
    private (set) var modee: Mode = .inactive
    
    
    // MARK: Data
    private (set) var lapTimes: [LapTime] = []
    private (set) var elapsedTime: TimeInterval = 0
    
    
    // MARK: Utilities
    private lazy var timer: TimeController = {
        let tc = TimeController(mode: .stopwatch) { [weak self] time in
            self?.update(for: time)
        }
        return tc
    }()
    
}


// MARK: - Interface
extension Stopwatch {
    
    func startOrStop() {
        switch modee {
        case .inactive: start()
        case .running: pause()
        case .paused: start()
        }
    }
    
    func recordLapTimeOrReset() {
        switch modee {
        case .inactive: return
        case .running: recordLapTime()
        case .paused: reset()
        }
    }
    
}


// MARK: - Helpers
extension Stopwatch {
    
    private func start() {
        modee = .running
        timer.start()
        notify()
    }
    
    private func pause() {
        modee = .paused
        timer.pause()
        notify()
    }
    
    private func reset() {
        modee = .inactive
        lapTimes.removeAll()
        timer.reset()
        notify()
    }
    
    private func recordLapTime() {
        let id = lapTimes.count + 1
        let lapTime = LapTime(id: id, value: elapsedTime)
        lapTimes.insert(lapTime, at: 0)
        notify()
    }
    
    private func update(for newTime: TimeInterval) {
        elapsedTime = newTime
        notify()
    }
    
}


// MARK: - Types
extension Stopwatch {
    
    enum Mode: String {
        case inactive
        case running
        case paused
    }
    
}

