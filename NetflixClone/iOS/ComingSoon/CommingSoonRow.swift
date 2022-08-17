//
//  CommingSoonRow.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/11.
//

import SwiftUI
import Kingfisher
import AVKit

struct CommingSoonRow: View {
    var movie: Movie
    
    @Binding var movieDetailToShow: Movie?
    
    let screen = UIScreen.main.bounds
    
    // video 링크
    var player: AVPlayer {
        AVPlayer(url: URL(string:
                         "https;//www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4")!)
    }
    
    var body: some View {
        VStack {
            // avKit
            VideoPlayer(player: player)
                .frame(height: 200)
            VStack {
                HStack {
                    KFImage(movie.thumbnailURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screen.size.width / 3, height: 75)
                        .clipped()
                    Spacer()
                    Button {
                        
                    } label: {
                        VStack(spacing: 5) {
                            Image(systemName: "bell")
                                .font(.title3)
                            Text("알림 예약하기")
                        }
                    }
                    .padding(.horizontal)
                    
                    Button {
                        movieDetailToShow = movie
                    } label: {
                        VStack (spacing: 5) {
                            Image(systemName: "info.circle")
                                .font(.title3)
                            Text("정보")
                        }
                    }
                    .padding(.horizontal)
                }
                .font(.subheadline)
            }
            .font(.caption)
            VStack (alignment: .leading, spacing: 5) {
                Text(movie.name)
                    .font(.title2)
                Text(movie.episodeDescribtionDisplay)
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
            .padding(.horizontal)
        }
        .foregroundColor(.white)
    }
    
}

struct CommingSoonRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            CommingSoonRow(movie: exampleMovie1, movieDetailToShow: .constant(nil))
        }
    }
}
