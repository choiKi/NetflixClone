//
//  WhiteButton.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/07/25.
//

import SwiftUI

struct PlayButton: View {
    
    var text: String
    var imageName: String
    var backgroundColor: Color = Color.white
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                Spacer()
                Image(systemName: imageName)
                    .font(.headline)
                Text(text)
                    .bold()
                    .font(.system(size: 16))
                Spacer()
            }
            .padding(.vertical, 6)
            .foregroundColor(backgroundColor == .white ? .black : .white)
            .background(backgroundColor)
            .cornerRadius(10)
        })
    }
    
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            PlayButton(text: "재 생", imageName: "play.fill", backgroundColor: Color.white) {
                
            }
        }
    }
}
