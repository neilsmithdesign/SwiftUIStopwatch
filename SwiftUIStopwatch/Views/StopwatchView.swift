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
                Top(stopwatch: self.stopwatch)
                Bottom(stopwatch: self.stopwatch)
            }
            .navigationBarTitle(Text("Stopwatch"), displayMode: .inline)
        }.environment(\.colorScheme, .dark)
    }
    
}


// MARK: Subviews
extension StopwatchView {
    
    private struct Top: View {
        
        @ObjectBinding var stopwatch: Stopwatch
        
        var body: some View {
            VStack {
                Spacer()
                TimeView(time: $stopwatch.elapsedTime, fontSize: 80)
                Spacer()
                StopwatchControlsView(
                    isActive: $stopwatch.isActive,
                    isRunning: $stopwatch.isRunning,
                    onTapLapReset: self.stopwatch.recordLapTimeOrReset,
                    onTapStartStop: self.stopwatch.startOrStop
                )
                Spacer()
            }.aspectRatio(1, contentMode: .fill)
        }
        
    }
    
    private struct Bottom: View {
        
        @ObjectBinding var stopwatch: Stopwatch
        
        var body: some View {
            List(stopwatch.lapTimes.identified(by: \.id)) { time in
                return LapTimeRow(number: time.id, time: time.value)
            }
        }
    }

}
