//
//  TimeInterval+Ext.swift
//  SwiftUIStopwatch
//
//  Created by Neil Smith on 20/06/2019.
//  Copyright © 2019 Neil Smith. All rights reserved.
//

import Foundation

extension TimeInterval {
    
    enum Component: Int {
        case minutes = 0
        case seconds
        case milliseconds
        var divisor: TimeInterval {
            switch self {
            case .minutes: return 60
            case .seconds: return 1
            case .milliseconds: return 0.001
            }
        }
        
        func value(for timeInterval: TimeInterval) -> Int {
            let n = timeInterval / self.divisor
            return Int(n)
        }
    }
    
    func components(_ comps: Set<Component>) -> [Component : Int] {
        var values: [Component : Int] = [:]
        var remainingTime = self
        for comp in comps.sorted(by: { $0.rawValue < $1.rawValue }) {
            let v = comp.value(for: remainingTime)
            values[comp] = v
            remainingTime -= TimeInterval(v) * comp.divisor
            print("rTime: \(remainingTime)")
        }
        return values
    }
    
    static func formatted(for values: [Component : Int]) -> String {
        var str = ""
        if let m = TimeInterval.getString(from: .minutes, for: values) {
            str += m
        }
        if let s = TimeInterval.getString(from: .seconds, for: values) {
            str += str.isEmpty ? s : ":\(s)"
        }
        if let ms = TimeInterval.getString(from: .milliseconds, for: values) {
            str += str.isEmpty ? ms.prefix(2) : ".\(ms.prefix(2))"
        }
        return str
    }
    
    private static func getString(from comp: Component, for values: [Component : Int]) -> String? {
        guard var n = values[comp] else { return nil }
        if comp == .milliseconds {
            n = n / 10
        }
        return n < 10 ? "0\(n)" : "\(n)"
    }
}
