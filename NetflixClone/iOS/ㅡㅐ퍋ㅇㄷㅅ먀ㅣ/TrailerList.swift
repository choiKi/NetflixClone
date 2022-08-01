//
//  TrailerList.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/01.
//

import SwiftUI

struct TrailerList: View {
    
    var trailers: [Trailer]
    let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            
            ForEach(trailers) { trailer in
                
                VStack(alignment: .leading) {
                    VideoPreviewImage(imageURL: trailer.thumanailImageURL, videoURL: trailer.videoURL)
                        .frame(maxWidth: screen.width)
                    Text(trailer.name)
                        .font(.headline)

                }
                .foregroundColor(.white)
                .padding(.bottom, 10)
                
            }
        }
    }
}

struct TrailerList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            TrailerList(trailers: exampleTrailers )
        }
        
    }
}
