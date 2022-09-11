//
//  timerView.swift
//  Mojarada WatchKit Extension
//
//  Created by 조은비 on 2022/09/11.
//

import SwiftUI

struct timerView: View {
    @ObservedObject var myTimer = MyTimer()
    @State private var animate = false
    @State private var bgColor = Color.black
    @State var hours: Int = 0
    @State var minutes: Int = 0
    @State var seconds: Int = 0
    @State var timerIsPaused: Bool = true
    @State var timer: Timer? = nil
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 180 , height: 180)
                .foregroundColor(Color.white)
                .colorMultiply(self.bgColor)
                .onAppear() {
                    withAnimation(.easeInOut(duration: 10)) {
                        self.bgColor = Color.green
                    }
                }
            VStack {
                topView(timerIsPaused: $timerIsPaused, hours: $hours, minutes: $minutes, seconds: $seconds)
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
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 140, height: 50)
                            .foregroundColor(.white)
                        Image(systemName: timerIsPaused ? "play.fill" : "pause.fill")
                            .foregroundColor(.green)
                            .font(.title3)
                    }
                })
                .frame(width: 160, height: 50)
            }
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


struct timerView_Previews: PreviewProvider {
    static var previews: some View {
        timerView()
    }
}

