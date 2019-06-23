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
