//
//  TrailerPlayerView.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/15.
//

import SwiftUI
import GSPlayer
import VideoPlayer
import Kingfisher

struct TrailerPlayerView: View {
    
    var videoURL: URL?
    
    @Binding var playVideo: Bool
    
    var body: some View {
        if videoURL != nil {
            VideoPlayer(url: videoURL!, play: $playVideo)
        } else {
            Text("실행할 비디오가 없습니다.")
        }
    }
}

struct TrailerPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerPlayerView(videoURL: nil, playVideo: .constant(true))
    }
}
