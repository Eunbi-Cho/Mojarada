//
//  topView.swift
//  Mojarada WatchKit Extension
//
//  Created by 조은비 on 2022/09/10.
//

import SwiftUI

struct topView: View {
    @Binding var timerIsPaused: Bool
    @Binding var hours: Int
    @Binding var minutes: Int
    @Binding var seconds: Int
    
    var body: some View {
        if timerIsPaused == true {
            HStack {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "minus.circle.fill")
                })
                .frame(width: 20, height: 20)
                Text("30 min")
                       Button(action: {
                           
                       }, label: {
                           Image(systemName: "plus.circle.fill")
                       })
                       .frame(width: 20, height: 20)
            }
        } else {
            HStack {
                Image(systemName: "timer")
                Text("\(hours) : \(minutes) : \(seconds)")
            }
        }
    }
}