//
//  EpisodeView.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/02.
//

import SwiftUI

struct EpisodeView: View {
    
    var episode: [Episode]
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    // picker에서 원하는 시즌을 택함
    func getEpisode(forSeason season: Int) -> [Episode] {
        return episode.filter( {$0.season == season})
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Button {
                showSeasonPicker = true
            } label: {
                Group {
                    Text("시즌 \(selectedSeason)")
                    Image(systemName: "chevron.down")
                }
                .font(.system(size: 18))
                Spacer()
            }
            // 에피소드 리스트
            
            // 선택된 시즌의 관련된 에피소드만
            ForEach(getEpisode(forSeason: selectedSeason)) { episode in
                VStack(alignment: .leading){
                    
                    HStack {
                        VideoPreviewImage(imageURL: episode.thumbnailURL, videoURL: episode.videoURL)
                            .frame(width: 120, height: 70)
                            .clipped()
                        VStack(alignment: .leading, spacing: 10) {
                            Text("\(episode.episodeNumber). \(episode.name)")
                            Text("\(episode.length)분")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(systemName: "arrow.down.to.line.alt")
                    }
                    
                    
                    Text(episode.description)
                        .font(.system(size: 16))
                        .lineLimit(2)
                }
                .padding(.bottom , 20)
                    
            }
            Spacer()
        }
        .foregroundColor(.white)
        .padding(.horizontal, 20)
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            EpisodeView(episode: allExampleEpisodes, showSeasonPicker: .constant(false), selectedSeason: .constant(1))
        }
        
    }
}
