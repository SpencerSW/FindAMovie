//
//  ActorCard.swift
//  FindAMovie
//
//  Created by Spencer McLaughlin on 4/10/24.
//

import SwiftUI

struct ActorCard: View {
    let actor: Actor
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if let backdropURL = actor.backdropURL {
                AsyncImage(url: backdropURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 180)
                        .padding(.bottom)
                } placeholder: {
                    Rectangle().fill(Color(red:61/255, green: 61/255, blue: 88/255))
                        .frame(width: 120, height: 180)
                }
            } else {
                Rectangle().fill(Color(red:61/255, green: 61/255, blue: 88/255))
                    .frame(width: 120, height: 180)
            }
            
            VStack {
                Text(actor.name)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.subheadline)
                    .lineLimit(1)
                Text(actor.character)
                    .foregroundColor(.white)
                    .font(.footnote)
                    .lineLimit(1)
            }
            .frame(width: 100, height: 20)
            .padding()
            .background(Color(red:61/255, green: 61/255, blue: 88/255))
        }
        .cornerRadius(10.0)
    }
}
