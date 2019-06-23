//
//  TimeView.swift
//  SwiftUIStopwatch
//
//  Created by Neil Smith on 20/06/2019.
//  Copyright © 2019 Neil Smith. All rights reserved.
//

import SwiftUI

struct TimeView: View {
    
    var time: TimeInterval
    let textColor: Color
    let fontSize: CGFloat
    let fontWeight: Font.Weight
    
    var body: some View {
        HStack(alignment: .lastTextBaseline, spacing: 0) {
            VStack { DigitView(text: time.minutes, textColor: textColor, fontSize: fontSize, fontWeight: fontWeight) }.frame(minWidth: 0, maxWidth: .infinity)
            VStack { TimeText(text: ":", textColor: textColor, fontSize: fontSize, fontWeight: fontWeight) }
            VStack { DigitView(text: time.seconds, textColor: textColor, fontSize: fontSize, fontWeight: fontWeight) }.frame(minWidth: 0, maxWidth: .infinity)
            VStack { TimeText(text: ".", textColor: textColor, fontSize: fontSize, fontWeight: fontWeight) }
            VStack { DigitView(text: time.milliseconds, textColor: textColor, fontSize: fontSize, fontWeight: fontWeight) }.frame(minWidth: 0, maxWidth: .infinity)
        }.padding([.leading, .trailing], 16)
    }
    
}

extension TimeView {
    
    private struct DigitView: View {
        
        let text: String
        let textColor: Color
        let fontSize: CGFloat
        let fontWeight: Font.Weight
        private var first: String { String(text.first!) }
        private var last: String { String(text.last!) }
        
        var body: some View {
            HStack(spacing: 0) {
                VStack { TimeText(text: first, textColor: textColor, fontSize: fontSize, fontWeight: fontWeight) }.frame(minWidth: 0, maxWidth: .infinity)
                VStack { TimeText(text: last, textColor: textColor, fontSize: fontSize, fontWeight: fontWeight) }.frame(minWidth: 0, maxWidth: .infinity)
            }
        }
    }
    
    private struct TimeText: View {
        
        let text: String
        let textColor: Color
        let fontSize: CGFloat
        let fontWeight: Font.Weight
        
        var body: some View {
            Text(text).color(textColor).font(.system(size: fontSize)).fontWeight(fontWeight).scaledToFit()
        }
    }
    
}
