//
//  ProfileView.swift
//  coStar
//
//  Created by Upasana Lamsal on 4/21/24.
//

import SwiftUI

struct ProfileView: View {
    let profile: Profile
    
    var body: some View {
        VStack {
            HStack{
                Image(uiImage: profile.profilePicture)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
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
                
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProfile = Profile(username: "ulamsal", sunSign: "Aries", moonSign: "Pisces", risingSign: "Leo", profilePicture: UIImage(named: "manMoon")!, name: "Upasana")
        return ProfileView(profile: sampleProfile)
    }
}
