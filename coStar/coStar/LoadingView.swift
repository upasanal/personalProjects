//
//  LoadingView.swift
//  coStar
//
//  Created by Upasana Lamsal on 4/4/24.
//
import SwiftUI

struct LoadingView: View {
    @State private var isLoading = true
    @State private var crescentScale: CGFloat = 0.0
    @State private var typedText = ""
    let loadingText = "The sky is a mirror"
    
    var body: some View {
        ZStack{
            VStack {
                if isLoading {
                    VStack{
                        ZStack {
                            // Black circle
                            // Adjust size as needed
                            Circle()
                                .fill(Color.black)
                                .frame(width: 150, height: 150)
                                .scaleEffect(0.5 - crescentScale)
                                .rotationEffect(.degrees(315))
                            Circle()
                                .fill(Color.white)
                                .frame(width: 108, height: 108)
                                .scaleEffect(0.5 - crescentScale)
                                .offset(x:5, y: -10)
                        }
                        .padding(-30)
                        Text(typedText)
                            .font(.custom("Consolas", size: 20))
                            .foregroundColor(.black)
                
                    }
                    
            
                } else {
                    // Once loading is finished, navigate to the home page
                    EndLoadView()
                }
                
            }
            
        }
        .onAppear {
            // Animate the transition to the crescent shape
            withAnimation(.easeInOut(duration: 4.0)) {
                crescentScale = 1.0
            }
            typeOutText()
            
            // Simulate loading delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation {
                    self.isLoading = false
                }
            }
        }
    }
    
    
    func typeOutText() {
        for (index, character) in loadingText.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.2) {
                typedText += String(character)
            }
        }
    }
}

#Preview {
    LoadingView()
}
