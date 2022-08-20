//
//  CustomTabSwitcher.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/07/29.
//

import SwiftUI
import Kingfisher

struct CustomTabSwitcher: View {
    
    @State private var currentTab: CustomTab = .episodes
    
    var tabs: [CustomTab]
    var movie: Movie
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    func widthForTab(_ tab: CustomTab) -> CGFloat {
        let string = tab.rawValue
        return string.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }
    
    var body: some View {
        
        VStack {
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(tabs , id: \.self) { tab in
                        VStack {
                            // redbar
                            Rectangle()
                                .frame(width: widthForTab(tab) , height: 6)
                                .foregroundColor(tab == currentTab ? Color.red : Color.clear)
                                .transition(.slide)
                                // .animation(.linear)
                            // btn
                            Button(action: {
                                //state
                                currentTab = tab
                            }, label: {
                                Text(tab.rawValue)
                                    .foregroundColor(tab == currentTab ? Color.white : Color.gray)
                                    
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: widthForTab(tab), height: 30)
                        }
                        
                    }
                }
            }
            switch currentTab {
                
            case .episodes:
                EpisodeView(episode: movie.episode ?? [], showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
            case .trailers:
                TrailerList(trailers: exampleTrailers)
            case .more:
                MoreMovie(movies: exampleMovies)
                
            }
            
        }
        .foregroundColor(.white)
    }
}

enum CustomTab: String {
    case episodes = "에피소드 보기"
    case trailers = "트레일러와 상세정보 보기"
    case more = "비슷한 영화 찾기"
}


struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            CustomTabSwitcher(tabs: [.episodes, .trailers, .more], movie: exampleMovie1, showSeasonPicker: .constant(false), selectedSeason: .constant(1))
        }
        
    }
}




