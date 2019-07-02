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
    private (set) var mode: Mode = .inactive
    
    
    // MARK: Data
    private (set) var elapsedTime: TimeInterval = 0
    private (set) var lapTimes: [LapTime] = []
    var currentLapTime: TimeInterval {
        guard let lapTime = lapTimes.first else { return 0 }
        return lapTime.value
    }
    
    
    // MARK: Utilities
    private lazy var timer: TimeController = {
        return TimeController(mode: .stopwatch) { [weak self] time in
            self?.update(for: time)
        }
    }()
    private lazy var lapTimer: TimeController = {
        return TimeController(mode: .stopwatch) { [weak self] time in
            self?.update(forLap: time)
        }
    }()
    
}


// MARK: - Interface
extension Stopwatch {
    
    func startOrStop() {
        switch mode {
        case .inactive: start()
        case .running: pause()
        case .paused: start()
        }
    }
    
    func recordLapTimeOrReset() {
        switch mode {
        case .inactive: return
        case .running: recordLapTime()
        case .paused: reset()
        }
    }
    
}


// MARK: - User interactions
extension Stopwatch {
 
    private func start() {
        mode = .running
        timer.start()
        startNewLapTimeIfNeeded()
        notify()
    }
    
    private func pause() {
        mode = .paused
        timer.pause()
        lapTimer.pause()
        notify()
    }
    
    private func reset() {
        mode = .inactive
        timer.reset()
        lapTimer.reset()
        lapTimes.removeAll()
        notify()
    }
    
    private func recordLapTime() {
        startNewLapTime()
        notify()
    }
    
}

// MARK: - Helpers
extension Stopwatch {
    
    private func startNewLapTimeIfNeeded() {
        if lapTimes.isEmpty {
            startNewLapTime()
        } else {
            lapTimer.resume()
        }
    }
    
    private func startNewLapTime() {
        let id = lapTimes.count + 1
        let lapTime = LapTime(id: id, value: 0, ranking: .other)
        lapTimes.insert(lapTime, at: 0)
        lapTimer.reset()
        lapTimer.start()
        lapTimes.analyse()
    }
    
    private func update(for newTime: TimeInterval) {
        elapsedTime = newTime
        notify()
    }
    
    private func update(forLap time: TimeInterval) {
        guard !lapTimes.isEmpty else { return }
        lapTimes[0].value = time
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

