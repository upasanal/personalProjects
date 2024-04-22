//
//  UpdateyView.swift
//  coStar
//
//  Created by Upasana Lamsal on 4/22/24.
//

import SwiftUI

struct UpdateyView: View {
    var body: some View {
        ScrollView {
            UpdateView()
            VStack(spacing: 20) {
                Image("update1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 550) // Same size as the circle
                    .padding(.top, -60)
                Image("update2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 550) // Same size as the circle
                    .padding(.top, -110)
            }
        }
        .padding(.bottom, -80)
    }
}


#Preview {
    UpdateyView()
}
