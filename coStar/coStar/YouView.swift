//
//  YouView.swift
//  coStar
//
//  Created by Upasana Lamsal on 4/18/24.
//

import SwiftUI
import UIKit

struct YouView: View {
    @State private var selectedTab = 0
    @State private var offsetY: CGFloat = 30
    @State private var bannerHeight: CGFloat = 10 // Initial height of BannerView
    @State private var showFriendsView = false
    @State private var showHomeView = false
    @State private var showShopView = false
    @State private var showYouView = false
    @State private var profile: Profile = Profile(username: "upasana1", sunSign: "Scorpio", moonSign: "Aries", risingSign: "Capricorn", profilePicture: UIImage(named: "manMoon")!, name: "upasana")
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                ScrollView {
                    VStack {
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 110)
                        // Height of the banner
                            .overlay(
                                VStack(spacing: 40) {
                                    Spacer()
                                    VStack {
                
                              
                                    } //Vstack end
                    }
                    .padding()
                )}
                                }
                .padding(10)
                .frame(maxWidth: .infinity) // Makes ScrollView wider across the screen
                
                // Regular BannerView at the top
                BannerView1()
                VStack{
                    HStack {
                        Button(action: {
                            selectedTab = 0
                        }) {
                            Text("Update")
                        }
                        .foregroundColor(selectedTab == 0 ? .black : .gray)
                        .padding()
                        Button(action: {
                            selectedTab = 1
                        }) {
                            Text("Chart")
                        }
                        .foregroundColor(selectedTab == 1 ? .black : .gray)
                        .padding()
                        Button(action: {
                            selectedTab = 2
                        }) {
                            Text("Saved")
                        }
                        .foregroundColor(selectedTab == 2 ? .black : .gray)
                        .padding()
                        Button(action: {
                            selectedTab = 3
                        }) {
                            Text("Settings")
                        }
                        .foregroundColor(selectedTab == 3 ? .black : .gray)
                        .padding()
                    }
                    .padding(.top, 10)
                    
                    TabView(selection: $selectedTab) {
                        ProfileView(profile: profile)
                                            .tag(0)
                                        SearchBarView()
                                            .tag(1)
                        ProfileView(profile:profile)
                                            .tag(2)
                                       SearchBarView()
                                            .tag(3)
                                    }
                                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                }
                .padding(.top, 50)
                
                                        Rectangle()
                                            .frame(width:390,height: 1) // Height of the line
                                            .foregroundColor(Color.gray.opacity(0.3)) // Light gray line color
                                            .padding(.top, 120)
                BottomBannerView4(showFriendsView: $showFriendsView, showHomeView: $showHomeView, showShopView: $showShopView, showYouView: $showYouView)
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

struct BottomBannerView4: View {
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



struct BannerView1: View {
    @State private var profile: Profile = Profile(username: "upasana1", sunSign: "Scorpio", moonSign: "Aries", risingSign: "Capricorn", profilePicture: UIImage(named: "manMoon")!, name: "upasana")
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.white)
                .frame(height: 110)
            // Height of the banner
                .overlay(
                    VStack(spacing: 40) {
                        Spacer()
                        VStack {
                            HStack{
                                Image(uiImage: profile.profilePicture)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .padding(.leading, -20)
                                VStack(alignment: .leading){
                                    Text("@\(profile.username)")
                                        .foregroundColor(Color.black.opacity(1))
                                        .font(.custom("Consolas", size: 17))
                                    HStack{
                                        Image("sun")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 15, height: 15)
                                        Text("\(profile.sunSign)")
                                            .font(.custom("Consolas", size: 15))
                                            .foregroundColor(Color.black.opacity(0.8))
                                        Image("moon")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 15, height: 15)
                                        Text("\(profile.moonSign)")
                                            .font(.custom("Consolas", size: 15))
                                            .foregroundColor(Color.black.opacity(0.8))
                                        Image("rising")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 20, height: 20)
                                        Text("\(profile.risingSign)")
                                            .font(.custom("Consolas", size: 15))
                                            .foregroundColor(Color.black.opacity(0.8))
                                
                                    }
                                }
                                .padding(.leading, -10)
                                
                            }
                            
                  
                        } //Vstack end
                     }
            
                )
           
        }
        .edgesIgnoringSafeArea(.top)
    }
}
#Preview {
    YouView()
}
