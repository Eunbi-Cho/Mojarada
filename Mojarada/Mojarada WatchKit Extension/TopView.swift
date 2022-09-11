//
//  TopView.swift
//  Mojarada WatchKit Extension
//
//  Created by 조은비 on 2022/09/10.
//

import SwiftUI

struct TopView: View {
    @Binding var timerIsPaused: Bool
    @Binding var hours: Int
    @Binding var minutes: Int
    @Binding var seconds: Int
    @Binding var goalTime: Double
    
    var body: some View {
        if timerIsPaused == true {
            HStack {
                Button(action: {
                    if goalTime >= 10 {
                        goalTime -= 10
                    } else {
                        self.disabled(true)
                    }
                }, label: {
                    Image(systemName: "minus.circle.fill")
                })
                .buttonStyle(PlainButtonStyle())
                Text("\(goalTime, specifier: "%.f")분")
                    .focusable(true)
                    .digitalCrownRotation($goalTime, from: 0, through: 300, by: 1, sensitivity: .low, isContinuous: false, isHapticFeedbackEnabled: true)
                Button(action: {
                    goalTime += 10
                }, label: {
                    Image(systemName: "plus.circle.fill")
                })
                .buttonStyle(PlainButtonStyle())
            }
        } else {
            HStack {
                Image(systemName: "hourglass")
                Text("\(goalTime)분")
            }
        }
    }
}
