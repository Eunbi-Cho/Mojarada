//
//  LogView.swift
//  Mojarada WatchKit Extension
//
//  Created by 유정인 on 2022/09/10.
//

import SwiftUI

struct LogView: View {
    var body: some View {
        NavigationView {
            CurrentLogView()
        }
    }
}

//    .digitalCrownRotation($position, from: 13, through: 2, by: 5)

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView()
    }
}
