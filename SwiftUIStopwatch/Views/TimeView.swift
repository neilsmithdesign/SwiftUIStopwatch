//
//  TimeView.swift
//  SwiftUIStopwatch
//
//  Created by Neil Smith on 20/06/2019.
//  Copyright © 2019 Neil Smith. All rights reserved.
//

import SwiftUI

struct TimeView: View {
    
    @Binding var time: TimeInterval
    let fontSize: CGFloat
    
    var body: some View {
        HStack(alignment: .lastTextBaseline, spacing: 0) {
            VStack { DigitView(text: time.minutes, fontSize: fontSize) }.frame(minWidth: 0, maxWidth: .infinity)
            VStack { TimeText(text: ":", fontSize: fontSize) }
            VStack { DigitView(text: time.seconds, fontSize: fontSize) }.frame(minWidth: 0, maxWidth: .infinity)
            VStack { TimeText(text: ".", fontSize: fontSize) }
            VStack { DigitView(text: time.milliseconds, fontSize: fontSize) }.frame(minWidth: 0, maxWidth: .infinity)
        }.padding([.leading, .trailing], 16)
    }
    
}

extension TimeView {
    
    private struct DigitView: View {
        
        let text: String
        let fontSize: CGFloat
        private var first: String { String(text.first!) }
        private var last: String { String(text.last!) }
        
        var body: some View {
            HStack(spacing: 0) {
                VStack { TimeText(text: first, fontSize: fontSize) }.frame(minWidth: 0, maxWidth: .infinity)
                VStack { TimeText(text: last, fontSize: fontSize) }.frame(minWidth: 0, maxWidth: .infinity)
            }
        }
    }
    
    private struct TimeText: View {
        
        let text: String
        let fontSize: CGFloat
        
        var body: some View {
            Text(text).font(.system(size: fontSize)).fontWeight(.thin)
        }
    }
    
}
