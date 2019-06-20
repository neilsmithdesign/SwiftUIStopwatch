//
//  TimeController.swift
//  SwiftUIStopwatch
//
//  Created by Neil Smith on 20/06/2019.
//  Copyright © 2019 Neil Smith. All rights reserved.
//

import Foundation
import QuartzCore

public final class TimeController: NSObject {
    
    
    // MARK: Interface
    public var isActive: Bool {
        return displayLink != nil
    }
    
    public func start(mode: Mode? = nil) {
        guard let mode = mode else {
            resume()
            return
        }
        self.mode = mode
        switch mode {
        case .stopwatch: totalElapsedTime = 0.0
        case .timer(startTime: let time): totalElapsedTime = time
        }
    }
    
    public func pause() {
        displayLink?.invalidate()
    }
    
    public func resume() {
        activateDisplayLink()
    }
    
    public func reset(deactivate: Bool = true) {
        displayLink?.invalidate()
        totalElapsedTime = 0.0
        callback(totalElapsedTime)
        if deactivate {
            displayLink = nil
        }
    }
    
    public init(mode: Mode, callback: @escaping (TimeInterval) -> Void) {
        self.mode = mode
        self.callback = callback
        switch mode {
        case .stopwatch: totalElapsedTime = 0.0
        case .timer(startTime: let time): totalElapsedTime = time
        }
        super.init()
    }
    
    public enum Mode {
        case stopwatch
        case timer(startTime: TimeInterval)
    }
    
    
    // MARK: Private properties
    private var startTime: TimeInterval = 0.0
    private var elapsedTime: TimeInterval = 0.0
    private var totalElapsedTime: TimeInterval
    
    private var displayLink: CADisplayLink? = nil
    private var callback: (TimeInterval) -> Void
    private var mode: Mode
    
    
    deinit {
        displayLink?.invalidate()
        displayLink = nil
    }
    
    private func activateDisplayLink() {
        startTime = CACurrentMediaTime()
        displayLink = nil
        displayLink = CADisplayLink(target: self, selector: #selector(updateTime))
        displayLink?.add(to: .main, forMode: .common)
        displayLink?.isPaused = false
    }
    
    @objc private func updateTime() {
        elapsedTime = CACurrentMediaTime() - startTime
        switch mode {
        case .stopwatch:
            totalElapsedTime += elapsedTime
            callback(totalElapsedTime)
        case .timer(startTime: _):
            totalElapsedTime -= elapsedTime
            guard totalElapsedTime > 0 else { return }
            callback(totalElapsedTime)
        }
        startTime = CACurrentMediaTime()
    }
    
}
