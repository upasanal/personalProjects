//
//  SearchBarView.swift
//  coStar
//
//  Created by Upasana Lamsal on 4/21/24.
//

import SwiftUI
import UIKit

struct SearchBarView: View {
    @State var searchText: String = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(maxWidth: .infinity, maxHeight: 200)
                .padding(.top, -130)// Adjust height as needed
            
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.gray.opacity(0.5))
                            .frame(width: 10, height:10)
                            .padding(.horizontal, 5)
                        
                        TextField("Search by username", text: $searchText)
                            .foregroundColor(Color.black)
                            .font(.custom("Consolas", size: 15))
                    }
                    .font(.headline)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.gray.opacity(0.3)))
                    .frame(width: 290)
                    
                    Button(action: {
                        searchText = ""
                        // Hide keyboard
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }) {
                        Text("CANCEL")
                            .padding()
                            .offset(x:10)
                            .foregroundColor(Color.black)
                            .font(.custom("Consolas", size: 14))
                    }
                    .padding(.leading, -20)
                }
                Rectangle()
                    .frame(width:370,height: 1) // Height of the line
                    .foregroundColor(Color.gray.opacity(0.3)) // Light gray line color
                    .padding(.top,10)
            }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
