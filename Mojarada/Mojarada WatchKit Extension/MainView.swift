//
//  MainView.swift
//  Mojarada WatchKit Extension
//
//  Created by 조은비 on 2022/06/29.
//

import SwiftUI

struct MainView: View {
<<<<<<< Updated upstream
    @State var goalTime = 0.0
    
    var body: some View {
        TabView {
            LogView()
            TimerView(goalTime: $goalTime)
=======
    @State var bgColor = Color.black
    
    var body: some View {
        TabView {
            CurrentLogView(bgColor: $bgColor, colorData: ColorData())
            TimerView(bgColor: $bgColor)
>>>>>>> Stashed changes
        }
        .tabViewStyle(PageTabViewStyle())
        .navigationBarTitle("모자라다")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
