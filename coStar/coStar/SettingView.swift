//
//  SettingView.swift
//  coStar
//
//  Created by Upasana Lamsal on 4/21/24.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        Image(systemName: "gear")
            .font(.system(size: 100)) // Adjust the font size as needed
                .foregroundColor(Color.gray)
                .padding()
                .frame(width: 500)
    }
}

#Preview {
    SettingView()
}
