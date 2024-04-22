//
//  ChartView.swift
//  coStar
//
//  Created by Upasana Lamsal on 4/21/24.
//

import SwiftUI

struct ChartView: View {
    var body: some View {
        ScrollView{
            Image("chart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 400, height: 550) // Same size as the circle
                .padding(.top, 0)
        }
        .padding(.bottom, -400)
    }
}

#Preview {
    ChartView()
}
