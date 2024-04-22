//
//  SavedView.swift
//  coStar
//
//  Created by Upasana Lamsal on 4/21/24.
//

import SwiftUI

struct SavedView: View {
    var body: some View {
        ScrollView{
            Image("save")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 550, height: 50)
                .padding(.top, 300)
        }
    }
}

#Preview {
    SavedView()
}
