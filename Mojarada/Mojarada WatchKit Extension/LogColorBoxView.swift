//
//  LogColorBoxView.swift
//  Mojarada WatchKit Extension
//
//  Created by 유정인 on 2022/09/10.
//

import SwiftUI

struct LogColorBoxView: View {
    var body: some View {
        HStack {
            ForEach(0..<5) { _ in
                VStack {
                    ForEach(0..<5) { _ in
                        Button {
                            print("touch")
                        } label: {
                            RoundedRectangle(cornerRadius: 8)
                                .scaledToFit()
                                .frame(width: 32)
                        }
                        .frame(width: 32, height: 32)
                    }
                }
            }
        }
    }
}

struct LogColorBoxView_Previews: PreviewProvider {
    static var previews: some View {
        LogColorBoxView()
    }
}
