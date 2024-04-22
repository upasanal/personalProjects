//
//  ContentView.swift
//  coStar
//
//  Created by Upasana Lamsal on 4/4/24.
//

import SwiftUI

struct ContentView: View {
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
                        Text("Good afternoon, upasana. It's 86°F and")
                            .foregroundColor(Color.black)
                            .font(.custom("Consolas", size: 13))
                            .padding(.top, 20)
                        Text("sunny in your area. Today at a glance:")
                            .foregroundColor(Color.black)
                            .font(.custom("Consolas", size: 13))
                            .padding(.top,-35)
                        Text("Arrogance will not help you grow.")
                            .font(.custom("OPTIRomanaRoman-Normal", size: 26))
                            .foregroundColor(.black)
                            .padding(.horizontal,30)
                            .padding(.top,-25)
                        Image("manMoon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 500, height: 500) // Same size as the circle
                            .foregroundColor(.black)
                            .padding(.top,-180)
                
                        Button(action: {
                            self.showHomeView = false
                            self.showFriendsView = false
                            self.showYouView = true
                            self.showShopView = false
                        }) {
                            NavigationLink(destination: YouView()) {
                                Text("DAILY UPDATES")
                                    .foregroundColor(Color.black)
                                    .font(.custom("Consolas", size: 15))
                                    .underline()
                            }
                        }
                        .padding(.top, -190)

                        ShareLink(item: URL(string: "https://apps.apple.com/us/app/co-star-personalized-astrology/id1264782561")!) {
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25) // Same size as the circle
                                .foregroundColor(.black.opacity(0.5))
                        }
                        .padding(.top,-190)
                        
                        Image("squiggle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 500, height: 500) // Same size as the circle
                            .padding(.top,-300)
                        Text("Through Wednesday")
                            .foregroundColor(Color.black.opacity(0.8))
                            .font(.custom("Consolas", size: 15))
                            .padding(.top, -180)
                        Text("Are you looking for intensity?")
                            .font(.custom("OPTIRomanaRoman-Normal", size: 26))
                            .foregroundColor(.black)
                            .padding(.horizontal,30)
                            .padding(.top,-180)
                        Text("Today, you're scared of patience. You want emotional issues to take precedence, yet you also insist on trampling over other people's feelings. It's also time to put yourself and your emotions out there for the world to see. First one foot. Then the other. ")
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.black.opacity(0.8))
                            .font(.custom("Consolas", size: 13))
                            .padding(.top, -150)
                            .frame(width: 330)
                            .lineSpacing(8)
                        HStack {
                            Spacer()
                            
                            VStack {
                                Text("Do")
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .font(.custom("Consolas", size: 15))
                                    .padding(.bottom, -2)
                                
                                VStack {
                                    Text("Thrifted jewlery")
                                        .foregroundColor(Color.black.opacity(0.8))
                                        .font(.custom("OPTIRomanaRoman-Normal", size: 23))
                                    Text("Butterscotch")
                                        .foregroundColor(Color.black.opacity(0.8))
                                        .font(.custom("OPTIRomanaRoman-Normal", size: 23))
                                    Text("Oil paintings")
                                        .foregroundColor(Color.black.opacity(0.8))
                                        .font(.custom("OPTIRomanaRoman-Normal", size: 23))
                                }
                            }
                            
                            Spacer().frame(width: 100) // Adjust the width of this spacer to change the distance between "do" and "don't"
                            
                            VStack {
                                Text("Don't")
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .font(.custom("Consolas", size: 15))
                                    .padding(.bottom, -2)
                                
                                VStack {
                                    Text("Divas")
                                        .foregroundColor(Color.black.opacity(0.8))
                                        .font(.custom("OPTIRomanaRoman-Normal", size: 23))
                                    Text("Third person")
                                        .foregroundColor(Color.black.opacity(0.8))
                                        .font(.custom("OPTIRomanaRoman-Normal", size: 23))
                                    Text("Knockoffs")
                                        .foregroundColor(Color.black.opacity(0.8))
                                        .font(.custom("OPTIRomanaRoman-Normal", size: 23))
                                }
        
                            }
                            Spacer()
                    
                            
                        }
                        Button(action: {
                            self.showHomeView = false
                            self.showFriendsView = false
                            self.showYouView = true
                            self.showShopView = false
                        }) {
                            NavigationLink(destination: FemaleMaleView()) {
                                Image("femalemale")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100) // Same size as the circle
                                    .foregroundColor(.black)
                                    .padding(.top,-20)
                            }
                        }
                        
                        Text("Transit exact tomorrow at 8:00 PM")
                            .foregroundColor(Color.gray)
                            .font(.custom("Consolas", size: 13))
                            .padding(.top,-20)
                       
                        Image("squib")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300) // Same size as the circle
                            .foregroundColor(.black)
                            .padding(.top,-110)
                        
                        Image("divide1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 380, height: 400) // Same size as the circle
                            .foregroundColor(.black)
                            .padding(.top,-300)
                            .padding(.leading, -50)
                        let sampleProfile = Profile(username: "ulamsal", sunSign: "Scorpio", moonSign: "Aquarius", risingSign: "Cancer", profilePicture: UIImage(named: "manMoon")!, name: "Upasana")
                        VStack{
                            ProfileView(profile: sampleProfile)
                                .padding(.top, -140)
                                .padding(.leading, -50)
                            VStack {
                                Text("Highly Compatible today:  \(sampleProfile.username)")
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .font(.custom("OPTIRomanaRoman-Normal", size: 23))
                                    .padding(.top, -60)
                                    .frame(alignment: .leading)
                                    .padding(.top, -30)
                                    .padding(.leading, -50)

                                Text("You and \(sampleProfile.username) are a hydra and its endless tentacles, tearing through every relationship and then lashing out with more appendages when they are done")
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .font(.custom("Consolas", size: 13))
                                    .padding(.top, -60)
                                    .padding(.leading, -2)
                                    .frame(width: 330, alignment: .leading)
                                    .lineSpacing(8)
                            }
                            HStack(spacing: 5){
                                ShareLink(item: URL(string: "https://apps.apple.com/us/app/co-star-personalized-astrology/id1264782561")!) {
                                    Image(systemName: "square.and.arrow.up")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20) // Same size as the circle
                                        .frame(alignment: .leading)
                                        .foregroundColor(.black.opacity(0.8))
                                    
                                }
                                .padding(.leading, 80)
                                Button(action: {
                                    self.showHomeView = false
                                    self.showFriendsView = false
                                    self.showYouView = true
                                    self.showShopView = false
                                }) {
                                    NavigationLink(destination: YouView()) {
                                        Text("VIEW PROFILE")
                                            .foregroundColor(Color.black)
                                            .font(.custom("Consolas", size: 12))
                                            .underline()
                                    }
                                }
                                .padding(.horizontal, 80)
                                .padding(.leading, 140)
                                
                            }
                            .padding(.top, 20)
                            
                        }
                
                        
                        
                        .padding(.horizontal, 20) // Adjust horizontal padding as needed
                        .padding(.top, -20)
                        .padding(.leading, 20)
                    
                        
                    }
                    VStack{
                        Image("divide2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 380, height: 400) // Same size as the circle
                            .foregroundColor(.black)
                            .padding(.top, -100)
                            .padding(.leading, -50)
                        
                        let sampleProfile = Profile(username: "skanta", sunSign: "Pisces", moonSign: "Pisces", risingSign: "Libra", profilePicture: UIImage(named: "manMoon")!, name: "Shreeya")
                        VStack{
                            ProfileView(profile: sampleProfile)
                                .padding(.top, -120)
                                .padding(.leading, -50)
                            VStack {
                                Text("You and  \(sampleProfile.username) as students of magic")
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .font(.custom("OPTIRomanaRoman-Normal", size: 23))
                                    .padding(.top, -40)
                                    .frame(alignment: .leading)
                                    .padding(.top, -30)
                                VStack{
                                    Text("🔮 \(sampleProfile.username) has the power of prophecy")
                                        .foregroundColor(Color.black.opacity(0.8))
                                        .font(.custom("Consolas", size: 13))
                                        .padding(.top, -40)
                                        .padding(.leading, 10)
                                        .frame(width: 330, alignment: .leading)
                                        .lineSpacing(8)
                                    Text("🕯️ You experiment with dark magic")
                                        .foregroundColor(Color.black.opacity(0.8))
                                        .font(.custom("Consolas", size: 13))
                                        .padding(.top, -10)
                                        .padding(.leading, 10)
                                        .frame(width: 330, alignment: .leading)
                                        .lineSpacing(8)
                                    Text("🤝 You try to persuade \(sampleProfile.username) to join your cause")
                                        .foregroundColor(Color.black.opacity(0.8))
                                        .font(.custom("Consolas", size: 13))
                                        .padding(.top, 20)
                                        .padding(.leading, 10)
                                        .frame(width: 330, alignment: .leading)
                                        .lineSpacing(8)
                                    
                                }
                            }
                            HStack(spacing: 5){
                                ShareLink(item: URL(string: "https://apps.apple.com/us/app/co-star-personalized-astrology/id1264782561")!) {
                                    Image(systemName: "square.and.arrow.up")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20) // Same size as the circle
                                        .frame(alignment: .leading)
                                        .foregroundColor(.black.opacity(0.8))
                                    
                                }
                                .padding(.leading, 80)
                                Button(action: {
                                    self.showHomeView = false
                                    self.showFriendsView = false
                                    self.showYouView = true
                                    self.showShopView = false
                                }) {
                                    NavigationLink(destination: YouView()) {
                                        Text("VIEW PROFILE")
                                            .foregroundColor(Color.black)
                                            .font(.custom("Consolas", size: 12))
                                            .underline()
                                    }
                                }
                                .padding(.horizontal, 80)
                                .padding(.leading, 140)
                                
                        
                            }
                            .padding(.top, 20)
                            Image("bottomHome")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 500, height: 400) // Same size as the circle
                                .frame(alignment: .center)
                        }
                
                        
                        
                        .padding(.horizontal, 20) // Adjust horizontal padding as needed
                        .padding(.top, -20)
                        
                        
                    }
                    
                    .padding()
               
                }
                .padding(.bottom, -40)
                .frame(maxWidth: .infinity)
                // Makes ScrollView wider across the screen
                
                // Regular BannerView at the top
                BannerView()
                Rectangle()
                    .frame(width:390,height: 1) // Height of the line
                    .foregroundColor(Color.gray.opacity(0.3)) // Light gray line color
                    .padding(.top, 720)
                BottomBannerView(showFriendsView: $showFriendsView, showHomeView: $showHomeView, showShopView: $showShopView, showYouView: $showYouView)
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

struct BannerView: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.white)
                .frame(height: 110)
            // Height of the banner
                .overlay(
                    HStack(spacing: 5) {
                         Text("Co ")
                             .font(.custom("OPTIRomanaRoman-Normal", size: 30))
                             .foregroundColor(.black)
                         Rectangle()
                             .frame(width: 30, height: 1) // Width and height of the long dash
                             .foregroundColor(.black)
                         Text(" Star")
                             .font(.custom("OPTIRomanaRoman-Normal", size: 30))
                             .foregroundColor(.black)
                     }
                     .padding(.vertical, 1000) // Add vertical padding if needed
                        .padding(.top,40)
                )
            Rectangle()
                .frame(width:370,height: 1) // Height of the line
                .foregroundColor(Color.gray.opacity(0.3)) // Light gray line color
                .padding(.top,-10)
        }
        .edgesIgnoringSafeArea(.top)
    }
}


struct BottomBannerView: View {
    @Binding var showFriendsView: Bool
    @Binding var showHomeView: Bool
    @Binding var showShopView: Bool
    @Binding var showYouView: Bool
    var body: some View {
        VStack {
            Rectangle()
                .frame(width:390,height: 1) // Height of the line
                .foregroundColor(Color.gray.opacity(0.3)) // Light gray line color
                .padding(.top, -90)
            Rectangle()
                .fill(Color.white)
                .frame(height: 150) // Height of the bottom banner
                .padding(.top,1100)
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
                                    Text("HOME")
                                        .foregroundColor(Color.black)
                                        .font(.custom("Consolas", size: 15))
                            }
                            Button(action: {
                                self.showHomeView = false
                                self.showFriendsView = true
                                self.showYouView = false
                                self.showShopView = false
                            }) {
                                NavigationLink(destination: FriendsView()) {
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
                                NavigationLink(destination: ShopView()) {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
