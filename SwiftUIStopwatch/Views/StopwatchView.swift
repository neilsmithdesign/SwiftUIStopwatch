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
        HStack(alignment: .lastTextBaseline, spacing: 0) {
            VStack { DigitView(text: minutes) }.frame(minWidth: 0, maxWidth: .infinity)
            VStack { TimeText(text: ":") }
            VStack { DigitView(text: seconds) }.frame(minWidth: 0, maxWidth: .infinity)
            VStack { TimeText(text: ".") }
            VStack { DigitView(text: milliseconds) }.frame(minWidth: 0, maxWidth: .infinity)
        }.padding([.leading, .trailing], 16)
    }
    
}

extension TimeView {
    
    private struct DigitView: View {
    
        let text: String
        private var first: String { String(text.first!) }
        private var last: String { String(text.last!) }
        
        var body: some View {
            HStack(spacing: 0) {
                VStack { TimeText(text: first) }.frame(minWidth: 0, maxWidth: .infinity)
                VStack { TimeText(text: last) }.frame(minWidth: 0, maxWidth: .infinity)
            }
        }
    }
    
    private struct TimeText: View {
        
        let text: String
        private let fontSize: CGFloat = 80
        
        var body: some View {
            Text(text).font(.system(size: fontSize)).fontWeight(.thin)
        }
    }
    
}
