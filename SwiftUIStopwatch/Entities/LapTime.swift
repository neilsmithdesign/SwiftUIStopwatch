//
//  LapTime.swift
//  SwiftUIStopwatch
//
//  Created by Neil Smith on 23/06/2019.
//  Copyright © 2019 Neil Smith. All rights reserved.
//

import SwiftUI

struct LapTime: Identifiable {
    var id: Int
    var value: TimeInterval
    var ranking: Ranking
    
    enum Ranking: String {
        case other
        case shortest
        case longest
        var color: Color {
            switch self {
            case .other: return .white
            case .shortest: return .green
            case .longest: return .red
            }
        }
    }
    
}


extension Array where Element == LapTime {
    
    /// Traverses the array of lap times to find the shortest and longest time
    /// and mutates in-place the 'ranking' property of each appropriately.
    /// Only applicable when there are 2 or more 'recorded' lap times.
    mutating func analyse() {
        
        guard self.count > 2 else { return }
        let recorded = Array(self.dropFirst())
        let shortest = recorded.min(by: { $0.value < $1.value })
        let longest = recorded.max(by: { $0.value < $1.value })
        var shortestIndex: Int?
        var longestIndex: Int?
        if let s = shortest, let index = self.firstIndex(where: { $0.value == s.value }) {
            shortestIndex = index
        }
        if let l = longest, let index = self.firstIndex(where: { $0.value == l.value }) {
            longestIndex = index
        }
        for i in 0..<self.count {
            if let sIndex = shortestIndex, sIndex == i {
                self[i].ranking = .shortest
            } else if let lIndex = longestIndex, lIndex == i {
                self[i].ranking = .longest
            } else {
                self[i].ranking = .other
            }
        }
        
    }
    
}
