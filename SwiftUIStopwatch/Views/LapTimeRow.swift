//
//  LapTimeRow.swift
//  SwiftUIStopwatch
//
//  Created by Neil Smith on 20/06/2019.
//  Copyright © 2019 Neil Smith. All rights reserved.
//

import SwiftUI

struct LapTimeRow: View {
    
    let lapTime: LapTime
    
    var timeText: String {
        return "\(lapTime.value.minutes):\(lapTime.value.seconds).\(lapTime.value.milliseconds)"
    }
    
    var body: some View {
        HStack {
            Text("Lap \(lapTime.id)").color(lapTime.ranking.color)
            Spacer()
            TimeView(time: lapTime.value, textColor: lapTime.ranking.color, fontSize: 17, fontWeight: .regular).frame(width: 104)
        }
    }
    
}
