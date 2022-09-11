//
//  MyTimer.swift
//  Mojarada WatchKit Extension
//
//  Created by 조은비 on 2022/09/10.
//

import Foundation
import SwiftUI
import Combine
 
class MyTimer: ObservableObject {
    @Published var value: Int = 0
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.value += 1
        }
    }
}
