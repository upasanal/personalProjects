//
//  FemaleMaleView.swift
//  coStar
//
//  Created by Upasana Lamsal on 4/18/24.
//

import SwiftUI

struct FemaleMaleView: View {
    @State private var offsetY: CGFloat = 30
    @State private var bannerHeight: CGFloat = 10 // Initial height of BannerView
    @State private var showFriendsView = false
    @State private var showHomeView = false
    @State private var showShopView = false
    @State private var showYouView = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                ScrollView {
                    VStack(spacing: 40) {
                        Spacer()
                        Text("Female Male")
                            .foregroundColor(Color.black)
                            .font(.custom("Consolas", size: 13))
                    }
                    .padding()
                }
                .padding(10)
                .frame(maxWidth: .infinity) // Makes ScrollView wider across the screen
                
                // Regular BannerView at the top
                BannerView()
                Rectangle()
                    .frame(width:390,height: 1) // Height of the line
                    .foregroundColor(Color.gray.opacity(0.3)) // Light gray line color
                    .padding(.top, 720)
                BottomBannerView5(showFriendsView: $showFriendsView, showHomeView: $showHomeView, showShopView: $showShopView, showYouView: $showYouView)
                    .frame(width:800, height:5)
                    .padding(.top,240)
            }
            .navigationBarHidden(true)
            
            if showFriendsView {
                FriendsView()
            } else if showHomeView {
                ContentView()
            } else if showShopView {
                ShopView()
            } else if showYouView {
                YouView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
        
}

struct BottomBannerView5: View {
    @Binding var showFriendsView: Bool
    @Binding var showHomeView: Bool
    @Binding var showShopView: Bool
    @Binding var showYouView: Bool
    var body: some View {
        VStack {
            Rectangle()
                .frame(width:390,height: 1) // Height of the line
                .foregroundColor(Color.gray.opacity(0.3)) // Light gray line color
                .padding(.top, -10)
            Rectangle()
                .fill(Color.white)
                .frame(height: 50) // Height of the bottom banner
                .padding(.top,1000)
                .edgesIgnoringSafeArea(.bottom)
                .overlay(
                    VStack {
                        HStack(spacing: 18) {
                            Button(action: {
                                // Navigate to Home view
                                self.showHomeView = true
                                self.showFriendsView = false
                                self.showYouView = false
                                self.showShopView = false
                            }) {
                                NavigationLink(destination: ContentView()) {
                                    Text("HOME")
                                        .foregroundColor(Color.gray.opacity(1))
                                        .font(.custom("Consolas", size: 15))
                                }
                            }
                            Button(action: {
                                self.showHomeView = false
                                self.showFriendsView = true
                                self.showYouView = false
                                self.showShopView = false
                            }) {
                                NavigationLink(destination: FriendsView()){
                                    Text("FRIENDS")
                                        .foregroundColor(Color.gray.opacity(1))
                                        .font(.custom("Consolas", size: 15))
                                }
                            }
                            Image("starryNight")
                                  .resizable()
                                  .aspectRatio(contentMode: .fit)
                                  .frame(width: 90, height: 90) // Same size as the circle
                                  .foregroundColor(.black)
                                  .clipShape(Circle())
                            Button(action: {
                                self.showHomeView = false
                                self.showFriendsView = false
                                self.showYouView = false
                                self.showShopView = true
                            }) {
                                NavigationLink(destination: ShopView()){
                                    Text("SHOP")
                                        .foregroundColor(Color.gray.opacity(1))
                                        .font(.custom("Consolas", size: 15))
                                }

                            
                            }
                            Button(action: {
                                self.showHomeView = false
                                self.showFriendsView = false
                                self.showYouView = true
                                self.showShopView = false
                            }) {
                                    Text("YOU")
                                        .foregroundColor(Color.black)
                                        .font(.custom("Consolas", size: 15))
                            }
                        }
                        Rectangle()
                            .frame(width:350,height: 1) // Height of the gray line
                            .foregroundColor(Color.gray.opacity(0.3))
                    }
                    .padding(.horizontal,10) // Add horizontal padding
                        .padding(.top,1000)

                )
                .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    FemaleMaleView()
}
