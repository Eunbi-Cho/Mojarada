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
    
    var colorData = ColorData()
    
    var body: some View {
        if self.seconds >= 10 {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 80 , height: 80)
                        .foregroundColor(Color.white)
                        .colorMultiply(self.bgColor)
                    Image(systemName: "checkmark")
                        .font(.title)
                }
                Text("모심기 완료")
                    .foregroundColor(.accentColor)
                    .bold()
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 2, trailing: 0))
                Text("오늘도 한시간을 채웠군요")
                    .multilineTextAlignment(.center)
            }
        } else {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 180 , height: 110)
                        .foregroundColor(Color.white)
                        .colorMultiply(self.bgColor)
                    VStack {
                        Text("딱 한시간만 하자!")
                            .padding(.top, 4)
                        HStack {
                            Text("\(minutes, specifier: "%02d")")
                                .bold()
                                .frame(width: 60)
                            Text(":")
                                .bold()
                            Text("\(seconds, specifier: "%02d")")
                                .bold()
                                .frame(width: 60)
                        }
                        .font(.title)
                        .padding(EdgeInsets(top: 6, leading: 0, bottom: 10, trailing: 0))
                    }
                }
                .padding(.bottom, 4)
                Button(action: {
                    colorChange()
                    timerIsPaused ? startTimer() : stopTimer()
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
    }
    func colorChange() {
        withAnimation(timerIsPaused ? nil : .easeInOut(duration: 10)) {
            bgColor = Color.accentColor
        }
        colorData.saveColor(color: bgColor)
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
