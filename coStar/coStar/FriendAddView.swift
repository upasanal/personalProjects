//
//  FriendAddView.swift
//  coStar
//
//  Created by Upasana Lamsal on 4/21/24.
//

import SwiftUI

struct FriendAddView: View {
    let profile: Profile
    @State private var isRequested: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                Rectangle()
                    .frame(width: 340, height: 1) // Height of the line
                    .foregroundColor(Color.gray.opacity(0.3))
                    .padding(.horizontal,50)// Light gray line color
                
                HStack {
                    Image(uiImage: profile.profilePicture)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .padding(.top,-10)
                        .padding(.leading, 20)
                    
                    VStack(alignment: .leading) {
                        HStack{
                            Text("\(profile.name)")
                                .foregroundColor(Color.black.opacity(1))
                                .font(.custom("Consolas", size: 17))
                            Text("@\(profile.username)")
                                .foregroundColor(Color.black.opacity(0.3))
                                .font(.custom("Consolas", size: 17))
                        }
                        Text("In your contacts")
                            .font(.custom("Consolas", size: 15))
                            .foregroundColor(Color.black.opacity(0.5))
                    }
                    .padding(.leading, -5)
                    
                    Spacer() // Pushes the button to the right edge
                    
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

struct RequestButton1: View {
    @Binding var isRequested: Bool
    
    var body: some View {
        Rectangle()
            .cornerRadius(3.0)
            .foregroundColor(isRequested ? .gray : .black)
            .frame(width: 50, height: 40)
            .overlay(
                Text(isRequested ? "ADDED" : "ADD")
                    .foregroundColor(.white)
                    .font(.custom("Consolas", size: 15))
            )
            .onTapGesture {
                isRequested.toggle()
            }
    }
}

struct FriendAddView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProfile = Profile(username: "ulamsal", sunSign: "Aries", moonSign: "Pisces", risingSign: "Leo", profilePicture: UIImage(named: "propic1")!, name: "upasana")
        return FriendAddView(profile: sampleProfile)
    }
}

