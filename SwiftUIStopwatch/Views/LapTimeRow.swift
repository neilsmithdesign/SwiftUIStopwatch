//
//  LapTimeRow.swift
//  SwiftUIStopwatch
//
//  Created by Neil Smith on 20/06/2019.
//  Copyright © 2019 Neil Smith. All rights reserved.
//

import SwiftUI

struct LapTimeRow: View {
    
    let number: Int
    var time: TimeInterval
    
    var timeText: String {
        return "\(time.minutes):\(time.seconds).\(time.milliseconds)"
    }
    
    var body: some View {
        HStack {
            Text("Lap \(number)")
            Spacer()
            TimeView(time: time, fontSize: 17, fontWeight: .regular).frame(width: 104)
        }
    }
    
}
