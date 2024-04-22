//
//  ShopView.swift
//  coStar
//
//  Created by Upasana Lamsal on 4/18/24.
//

import SwiftUI

struct ShopView: View {
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
                        Image("shopFlower")
                              .resizable()
                              .aspectRatio(contentMode: .fit)
                              .frame(width: 120, height: 120) // Same size as the circle
                              .foregroundColor(.black)
                              .padding(.leading, 240)
                              .padding(.top, -50)
                        Image("shopLeaf")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 200) // Same size as the circle
                            .foregroundColor(.black)
                            .padding(.leading, -324)
                            .padding(.top, -100)
                        HStack {
                            VStack(spacing: 20) {
                                Text("Shop")
                                    .foregroundColor(Color.black)
                                    .font(.custom("OPTIRomanaRoman-Normal", size: 35))
                                
                                Spacer()
                                
                                Text("Premium reports and other extended features")
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .font(.custom("Consolas", size: 15))
                                    .padding(.top, -25)
                                    .frame(width: 300)
                                    .lineSpacing(8)
                                
                                Spacer()
                                
                                Text("VIEW YOUR PURCHASED READINGS")
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color.black.opacity(0.5))
                                    .font(.custom("Consolas", size: 15))
                                    .padding(.top, -25)
                                    .frame(width: 300)
                                    .lineSpacing(8)
                                    .underline()
                            }
                            .padding(.top, -200)
                        }
                        VStack{
                            Image("shopBan1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 500, height: 550) // Same size as the circle
                                .foregroundColor(.black)
                            Image("shopBan2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 500, height: 550) // Same size as the circle
                                .foregroundColor(.black)
                            Image("shopBan3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 500, height: 550) // Same size as the circle
                                .foregroundColor(.black)
                        }
                        .padding(.top, -50)
                    }
                    .padding()
                }
                .padding(10)
                .frame(maxWidth: .infinity) // Makes ScrollView wider across the screen
                
                // Regular BannerView at the top
                ShopBannerView()
                Rectangle()
                    .frame(width:390,height: 1) // Height of the line
                    .foregroundColor(Color.gray.opacity(0.3)) // Light gray line color
                    .padding(.top, 720)
                BottomBannerView3(showFriendsView: $showFriendsView, showHomeView: $showHomeView, showShopView: $showShopView, showYouView: $showYouView)
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

struct BottomBannerView3: View {
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
                                    Text("SHOP")
                                        .foregroundColor(Color.black)
                                        .font(.custom("Consolas", size: 15))
                            
                            }
                            Button(action: {
                                self.showHomeView = false
                                self.showFriendsView = false
                                self.showYouView = true
                                self.showShopView = false
                            }) {
                                NavigationLink(destination: YouView()) {
                                    Text("YOU")
                                        .foregroundColor(Color.gray.opacity(1))
                                        .font(.custom("Consolas", size: 15))
                                }
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


struct ShopBannerView: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.white)
                .frame(height: 110) // Height of the banner
                .overlay(
                    HStack() {
                         Text("SHOP")
                             .font(.custom("Consolas", size: 15))
                             .foregroundColor(.black.opacity(0.8))
                     }
                     .padding(.vertical, 1000) // Add vertical padding if needed
                        .padding(.top,50)
                )
            Rectangle()
                .frame(width:370,height: 1) // Height of the line
                .foregroundColor(Color.gray.opacity(0.3)) // Light gray line color
                .padding(.top,-10)
        }
        .edgesIgnoringSafeArea(.top)
    }
}


#Preview {
    ShopView()
}
