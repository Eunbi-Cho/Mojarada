//
//  CurrentLogView.swift
//  Mojarada WatchKit Extension
//
//  Created by 유정인 on 2022/09/10.
//

import SwiftUI

struct CurrentLogView: View {
    @Binding var bgColor: Color
    
    var colorData: ColorData
    var columns: [GridItem] = Array(repeating: .init(.adaptive(minimum: 30, maximum: .infinity)), count: 5)
    var today = Date()

    static let dateformatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "M월 d일"

        return formatter
    }()
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach((0..<25).reversed(), id: \.self) { i in
                let logDate = Date(timeIntervalSinceNow: 86400*Double(-i))
                Button {
                    print(logDate)
                } label: {
                    RoundedRectangle(cornerRadius: 8)
                        .scaledToFit()
                        .frame(width: 32)
                        .foregroundColor(bgColor)
                        .overlay {
                            Text(logDate, formatter: CurrentLogView.dateformatter)
                                .foregroundColor(.black)
                                .font(.system(size: 10))
                        }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .offset(x: 0, y: 10)
        .padding(10)
        .onAppear {
            bgColor = colorData.loadColor()
        }
    }
}



//struct LogColorBoxView_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrentLogView()
//    }
//}
