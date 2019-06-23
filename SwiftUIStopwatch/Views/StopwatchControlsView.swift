//
//  StopwatchControlsView.swift
//  SwiftUIStopwatch
//
//  Created by Neil Smith on 19/06/2019.
//  Copyright © 2019 Neil Smith. All rights reserved.
//

import SwiftUI

struct StopwatchControlsView : View {
    
    @Binding var mode: Stopwatch.Mode
    
    var onTapLapReset: () -> Void
    var onTapStartStop: () -> Void
    
    var body: some View {
        HStack {
            LapResetButton(mode: $mode, action: onTapLapReset)
            Spacer()
            StartStopButton(mode: $mode, action: onTapStartStop)
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
    
}
