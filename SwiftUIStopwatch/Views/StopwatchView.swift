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
            StopwatchControlsView(
                isActive: $stopwatch.isActive,
                isRunning: $stopwatch.isRunning,
                onTapLapReset: self.stopwatch.recordLapTimeOrReset,
                onTapStartStop: self.stopwatch.startOrStop
            )
            .navigationBarTitle(Text("Stopwatch"), displayMode: .inline)
        }
    }
}


//#if DEBUG
//struct StopwatchView_Previews : PreviewProvider {
//    static var previews: some View {
//        StopwatchView()
//    }
//}
//#endif



