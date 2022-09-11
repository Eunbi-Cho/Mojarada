//
//  MainView.swift
//  Mojarada WatchKit Extension
//
//  Created by 조은비 on 2022/06/29.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            LogView()
            TimerView()
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
