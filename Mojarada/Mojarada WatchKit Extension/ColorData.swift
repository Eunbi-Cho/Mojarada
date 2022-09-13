//
//  ColorData.swift
//  Mojarada WatchKit Extension
//
//  Created by 유정인 on 2022/09/13.
//

import SwiftUI

struct ColorData {
    private var colorKey = "COLOR_KEY"
    private var userDefaults = UserDefaults.standard
    
    func saveColor(color: Color) {
        let color = UIColor(color).cgColor
        
        if let components = color.components {
            userDefaults.set(components, forKey: colorKey)
            print(components)
            print("Color saved")
        }
    }
    
    func loadColor() -> Color {
        guard let array = userDefaults.object(forKey: colorKey) as?
                [CGFloat] else { return Color.black }
        let color = Color(.sRGB,
                          red: array[0],
                          green: array[1],
                          blue: array[2],
                          opacity: array[3]
        )
        print(color)
        print("Color loaded")
        return color
    }
}
