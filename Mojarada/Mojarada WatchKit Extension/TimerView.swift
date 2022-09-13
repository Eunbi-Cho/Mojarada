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
    @Binding var bgColor: Color
    @State var hours: Int = 0
    @State var minutes: Int = 0
    @State var seconds: Int = 0
    @State var timerIsPaused: Bool = true
    @State var timer: Timer? = nil
    @Binding var goalTime: Double
    
    var colorData = ColorData()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 160 , height: 160)
                .foregroundColor(Color.white)
                .colorMultiply(self.bgColor)
                .onAppear() {
                    withAnimation(.easeInOut(duration: 10)) {
                        self.bgColor = Color.accentColor
                    }
                }
            VStack {
                TopView(timerIsPaused: $timerIsPaused, hours: $hours, minutes: $minutes, seconds: $seconds, goalTime: $goalTime)
                HStack {
                    Text("\(hours)")
                    Text(" : ")
                    Text("\(minutes)")
                    Text(" : ")
                    Text("\(seconds)")
                }
                .font(.title2)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                Button(action: {
                    timerIsPaused ? startTimer() : stopTimer()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 130, height: 40)
                            .foregroundColor(.white)
                        Image(systemName: timerIsPaused ? "play.fill" : "pause.fill")
                            .foregroundColor(.green)
                            .font(.title3)
                    }
                })
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
    
<<<<<<< Updated upstream
=======
    func colorChange() {
        withAnimation(.easeInOut(duration: 10)) {
            bgColor = Color.accentColor
            colorData.saveColor(color: bgColor)
        }
    }
    
>>>>>>> Stashed changes
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
