//
//  EndLoadView.swift
//  coStar
//
//  Created by Upasana Lamsal on 4/4/24.
//

import SwiftUI


struct EndLoadView: View {
    @State private var isLoading = true
    
    var body: some View {
        VStack {
            if isLoading {
                VStack{
                    ZStack {
                        // Black circle
                        // Adjust size as needed
                        Image("loadingMoon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400, height: 400) //Adjust size as needed
                       
                    }
                    .padding(-160)
                    Text("The sky is a mirror")
                        .font(.custom("Consolas", size: 20))
                        .foregroundColor(.black)
            
                }
                
                 // Bottom spacer
            } else {
                // Once loading is finished, navigate to the home page
                // Replace HomeView() with your actual home page view
                ContentView()
            }
        }
        
        .onAppear {
            // Simulate loading delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    self.isLoading = false
                }
            }
        }
    }
}
#Preview {
    EndLoadView()
}
