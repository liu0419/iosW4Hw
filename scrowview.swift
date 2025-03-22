//
//  scrowview.swift
//  w4Hw
//
//  Created by 劉丞晏 on 2025/3/22.
//

import SwiftUI

struct ontentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                ForEach(1...20, id: \.self) { i in
                    Text("第 \(i) 個區塊")
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(Color(hue: Double(i)/20.0, saturation: 0.6, brightness: 0.9))
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
            .padding(.top)
        }
        .background(Color(.systemGray6))
        .ignoresSafeArea()
    }
}

#Preview {
    ontentView()
}
