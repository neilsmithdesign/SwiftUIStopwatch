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
                TimeView(time: $stopwatch.elapsedTime)
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



struct TimeView: View {
    
    @Binding var time: TimeInterval
    
    var minutes: String {
        let strings = TimeInterval.formatted(for: time.values([.minutes, .seconds, .milliseconds]))
        return strings[.minutes]!
    }
    var seconds: String {
        let strings = TimeInterval.formatted(for: time.values([.minutes, .seconds, .milliseconds]))
        return strings[.seconds]!
    }
    var milliseconds: String {
        let strings = TimeInterval.formatted(for: time.values([.minutes, .seconds, .milliseconds]))
        return strings[.milliseconds]!
    }
    
    var body: some View {
        HStack {
            DigitView(text: minutes)
            DigitView(text: ":")
            DigitView(text: seconds)
            DigitView(text: ".")
            DigitView(text: milliseconds)
        }
    }
    
    private struct DigitView: View {
        
        let text: String
        
        var body: some View {
            Text(text).font(.system(size: 84)).fontWeight(.thin)
        }
        
    }
    
}
