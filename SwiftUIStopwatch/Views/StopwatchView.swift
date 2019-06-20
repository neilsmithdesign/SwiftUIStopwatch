//
//  StopwatchView.swift
//  SwiftUIStopwatch
//
//  Created by Neil Smith on 19/06/2019.
//  Copyright © 2019 Neil Smith. All rights reserved.
//

import SwiftUI

struct StopwatchView : View {
    
    @ObjectBinding var stopwatch: Stopwatch
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("00:00.00").font(.system(size: 84)).fontWeight(.thin)
                Spacer()
                StopwatchControlsView(
                    isActive: $stopwatch.isActive,
                    isRunning: $stopwatch.isRunning,
                    onTapLapReset: self.stopwatch.recordLapTimeOrReset,
                    onTapStartStop: self.stopwatch.startOrStop
                    )
                Spacer()
            }
            .environment(\.colorScheme, .dark)
            .navigationBarTitle(Text("Stopwatch"), displayMode: .inline)
        }.environment(\.colorScheme, .dark)
    }
}



