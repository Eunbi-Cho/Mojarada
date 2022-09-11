//
//  TimerView.swift
//  Mojarada WatchKit Extension
//
//  Created by 조은비 on 2022/09/11.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject var myTimer = MyTimer()
    @State private var animate = false
    @State private var bgColor = Color.black
    @State var hours: Int = 0
    @State var minutes: Int = 0
    @State var seconds: Int = 0
    @State var timerIsPaused: Bool = true
    @State var timer: Timer? = nil
    @Binding var goalTime: Double
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 180 , height: 110)
                    .foregroundColor(Color.white)
                    .colorMultiply(self.bgColor)
                VStack {
                    TopView(timerIsPaused: $timerIsPaused, hours: $hours, minutes: $minutes, seconds: $seconds, goalTime: $goalTime)
                    HStack {
                        Text("\(hours, specifier: "%02d")")
                            .frame(width: 40)
                        Text(":")
                        Text("\(minutes, specifier: "%02d")")
                            .frame(width: 40)
                        Text(":")
                        Text("\(seconds, specifier: "%02d")")
                            .frame(width: 40)
                    }
                    .font(.title2)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                }
            }
            Button(action: {
                if goalTime < 1 {
                    self.disabled(true)
                } else {
                    colorChange()
                    timerIsPaused ? startTimer() : stopTimer()
                }
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 180, height: 40)
                        .foregroundColor(.accentColor)
                    Image(systemName: timerIsPaused ? "play.fill" : "pause.fill")
                        .foregroundColor(.white)
                        .font(.title3)
                }
            })
            .buttonStyle(PlainButtonStyle())
        }
    }
    
    func colorChange() {
        withAnimation(.easeInOut(duration: goalTime * 60)) {
            bgColor = Color.accentColor
        }
    }
    
    func startTimer() {
        timerIsPaused = false
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            if self.seconds == 59 {
                self.seconds = 0
                if self.minutes == 59 {
                    self.minutes = 0
                    self.hours = self.hours + 1
                } else {
                    self.minutes = self.minutes + 1
                }
            } else {
                self.seconds = self.seconds + 1
            }
        }
    }
    
    func stopTimer() {
        timerIsPaused = true
        timer?.invalidate()
        timer = nil
    }
}


//struct timerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerView()
//    }
//}
