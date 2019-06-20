//
//  StopwatchControlsView.swift
//  SwiftUIStopwatch
//
//  Created by Neil Smith on 19/06/2019.
//  Copyright © 2019 Neil Smith. All rights reserved.
//

import SwiftUI

struct StopwatchControlsView : View {
    
    @Binding var isActive: Bool
    @Binding var isRunning: Bool
    
    var onTapLapReset: () -> Void
    var onTapStartStop: () -> Void
    
    var body: some View {
        HStack {
            LapResetButton(isActive: $isActive, isRunning: $isRunning, action: onTapLapReset)
            Spacer()
            StartStopButton(isActive: $isActive, isRunning: $isRunning, action: onTapStartStop)
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
    
}
